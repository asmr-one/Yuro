import 'package:flutter/foundation.dart';
import 'package:asmrapp/data/models/works/work.dart';
import 'package:asmrapp/data/models/works/pagination.dart';
import 'package:asmrapp/data/services/api_service.dart';
import 'package:asmrapp/utils/logger.dart';

abstract class PaginatedWorksViewModel extends ChangeNotifier {
  final ApiService _apiService;
  List<Work> _works = [];
  bool _isLoading = false;
  String? _error;
  Pagination? _pagination;
  int _currentPage = 1;

  PaginatedWorksViewModel(this._apiService) {
    _init();
  }

  // 修改为异步初始化
  Future<void> _init() async {
    await onInit(); // 添加初始化钩子
    loadPage(1);
  }

  // 添加初始化钩子，供子类重写
  Future<void> onInit() async {}

  // Getters
  List<Work> get works => _works;
  bool get isLoading => _isLoading;
  String? get error => _error;
  int get currentPage => _currentPage;
  int? get totalPages => _pagination?.totalCount != null && _pagination?.pageSize != null
      ? (_pagination!.totalCount! / _pagination!.pageSize!).ceil()
      : null;

  // 获取页面名称，用于日志
  String get pageName;

  // 子类必须实现的方法
  Future<WorksResponse> fetchPage(int page);

  // 获取 ApiService 实例，供子类使用
  ApiService get apiService => _apiService;

  // 通用的加载逻辑
  Future<void> loadPage(int page) async {
    if (_isLoading) return;
    if (page < 1 || (totalPages != null && page > totalPages!)) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      AppLogger.info('加载$pageName: 第$page页');
      final response = await fetchPage(page);
      _works = response.works;
      _pagination = response.pagination;
      _currentPage = page;
      AppLogger.info('第$page页$pageName加载成功: ${response.works.length}个作品');
    } catch (e) {
      AppLogger.error('加载$pageName失败', e);
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // 刷新方法
  Future<void> refresh() async {
    AppLogger.info('刷新$pageName');
    await loadPage(1);
  }

  @override
  void dispose() {
    AppLogger.info('销毁$pageName ViewModel');
    super.dispose();
  }
} 