import 'package:flutter/foundation.dart';
import 'package:asmrapp/data/models/works/work.dart';
import 'package:asmrapp/data/models/works/pagination.dart';
import 'package:asmrapp/data/services/api_service.dart';
import 'package:asmrapp/utils/logger.dart';
import 'package:get_it/get_it.dart';

class PopularViewModel extends ChangeNotifier {
  final ApiService _apiService;
  List<Work> _works = [];
  bool _isLoading = false;
  String? _error;
  Pagination? _pagination;
  int _currentPage = 1;

  PopularViewModel() : _apiService = GetIt.I<ApiService>();

  List<Work> get works => _works;
  bool get isLoading => _isLoading;
  String? get error => _error;
  int get currentPage => _currentPage;
  int? get totalPages =>
      _pagination?.totalCount != null && _pagination?.pageSize != null
          ? (_pagination!.totalCount! / _pagination!.pageSize!).ceil()
          : null;

  /// 加载指定页面的数据
  Future<void> loadPage(int page) async {
    if (_isLoading) return;
    if (page < 1 || (totalPages != null && page > totalPages!)) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await _apiService.getPopular(page: page);
      _works = response.works;
      _pagination = response.pagination;
      _currentPage = page;
      AppLogger.info('第$page页热门列表加载成功: ${response.works.length}个作品');
    } catch (e) {
      AppLogger.error('加载热门列表失败', e);
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// 加载热门列表(用于初始加载和刷新)
  Future<void> loadPopular({bool refresh = false}) async {
    await loadPage(1);
  }
} 