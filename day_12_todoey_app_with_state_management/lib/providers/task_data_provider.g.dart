// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TaskData)
final taskDataProvider = TaskDataProvider._();

final class TaskDataProvider extends $NotifierProvider<TaskData, List<Task>> {
  TaskDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'taskDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$taskDataHash();

  @$internal
  @override
  TaskData create() => TaskData();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Task> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Task>>(value),
    );
  }
}

String _$taskDataHash() => r'3e8b240272eba4af6ff87d99d3a22e9aef6fc292';

abstract class _$TaskData extends $Notifier<List<Task>> {
  List<Task> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<Task>, List<Task>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Task>, List<Task>>,
              List<Task>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
