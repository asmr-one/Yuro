import 'package:flutter/foundation.dart';
import 'package:asmrapp/data/models/works/work.dart';
import 'package:asmrapp/data/services/api_service.dart';
import 'package:asmrapp/utils/logger.dart';

class HomeViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Work> _works = [];
  bool _isLoading = false;
  String? _error;
  int _currentPage = 1;

  List<Work> get works => _works;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadWorks({bool refresh = false}) async {
    if (refresh) {
      AppLogger.info('刷新作品列表');
      _currentPage = 1;
      _works = [];
    }

    if (_isLoading) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      AppLogger.info('加载作品列表: 第$_currentPage页');
      final newWorks = await _apiService.getWorks(page: _currentPage);
      _works = refresh ? newWorks : [..._works, ...newWorks];
      _currentPage++;
      AppLogger.info('作品列表加载成功: ${newWorks.length}个作品');
    } catch (e) {
      AppLogger.error('加载作品列表失败', e);
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void onWorkTap(Work work) {
    // TODO: 实现作品点击逻辑
  }

  void onSearch() {
    // TODO: 实现搜索逻辑
  }
}