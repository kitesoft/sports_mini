import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
//全局Redux store 的对象，保存State数据
class GSYState {
  User userInfo;
  ThemeData themeData;
  Locale locale;
  GSYState({this.userInfo, this.themeData, this.locale});
}

// 创建 Reducer
// 源码中 Reducer 是一个方法 typedef State Reducer<State>(State state, dynamic action);
// 自定义 appReducer 用于创建 store
GSYState appReducer(GSYState state, action) {
  return GSYState(
    // 通过自定义的UserReducer 将 GSYState 内的 userInfo 和 action 关联
    userInfo: UserReducer(state.userInfo, action),
    themeData: ThemeDataReducer(state.themeData, action),
    locale: LocaleReducer(state.locale, action),
  );
}

// 通过 flutter_redux 的 combineReducers 创建 Reducer<State>
final ThemeDataReducer = combineReducers<ThemeData>([
  // 将 Action, 处理Action动作的方法，State 绑定
  TypedReducer<ThemeData, RefreshThemeDataAction>(_refresh),
]);

//定义处理 Action 行为的方法，返回新的 State
ThemeData _refresh(ThemeData themeData, action) {
  themeData = action.themeData;
  return themeData;
}

// 定义一个Action 类
// 将该Action 在Reducer 中与处理该Action的方法绑定
class RefreshThemeDataAction {
  final ThemeData themeData;
  RefreshThemeDataAction(this.themeData);
}