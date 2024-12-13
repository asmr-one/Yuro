import 'package:asmrapp/core/audio/models/subtitle.dart';

abstract class ISubtitleService {
  // 字幕加载
  Future<void> loadSubtitle(String url);
  
  // 字幕状态流
  Stream<SubtitleList?> get subtitleStream;
  
  // 当前字幕流
  Stream<Subtitle?> get currentSubtitleStream;
  
  // 当前字幕
  Subtitle? get currentSubtitle;
  
  // 更新播放位置
  void updatePosition(Duration position);
  
  // 资源释放
  void dispose();
  
  // 添加这一行
  SubtitleList? get subtitleList;  // 获取当前字幕列表
} 