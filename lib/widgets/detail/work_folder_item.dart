import 'package:flutter/material.dart';
import 'package:asmrapp/data/models/files/child.dart';
import 'package:asmrapp/utils/logger.dart';
import 'package:asmrapp/widgets/detail/work_file_item.dart';
import 'package:asmrapp/core/audio/models/file_path.dart';

class WorkFolderItem extends StatelessWidget {
  final Child folder;
  final double indentation;
  final Function(Child file)? onFileTap;

  // 支持的音频格式列表，按优先级排序
  static const _audioFormats = ['.mp3', '.wav'];

  // 静态变量用于跟踪第一个包含音频的文件夹的完整路径
  static List<String>? _audioFolderPath;

  // 静态方法用于重置展开状态
  static void resetExpandState() {
    _audioFolderPath = null;
  }

  const WorkFolderItem({
    super.key,
    required this.folder,
    required this.indentation,
    this.onFileTap,
  });

  bool _shouldExpandFolder(Child folder) {
    // 如果还没有找到第一个音频文件夹，就搜索并记录
    _audioFolderPath ??= FilePath.findFirstAudioFolderPath(
        [folder],
        formats: _audioFormats,
      );

    // 判断当前文件夹是否在音频文件夹的路径上
    return FilePath.isInPath(_audioFolderPath, folder.title);
  }

  @override
  Widget build(BuildContext context) {
    final shouldExpand = _shouldExpandFolder(folder);
    return Theme(
      data: ThemeData(dividerColor: Colors.transparent),
      child: Padding(
        padding: EdgeInsets.only(left: indentation),
        child: ExpansionTile(
          title: Text(
            folder.title ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: const Icon(Icons.folder, color: Colors.amber),
          initiallyExpanded: shouldExpand,
          children: folder.children
                  ?.map((child) => child.type == 'folder'
                      ? WorkFolderItem(
                          folder: child,
                          indentation: indentation + 16.0,
                          onFileTap: onFileTap,
                        )
                      : WorkFileItem(
                          file: child,
                          indentation: indentation + 16.0,
                          onFileTap: onFileTap,
                        ))
                  .toList() ??
              [],
          onExpansionChanged: (expanded) {
            AppLogger.debug(
              '${expanded ? "展开" : "折叠"}文件夹: ${folder.title}',
            );
          },
        ),
      ),
    );
  }
}
