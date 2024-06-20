# 说明文档
## 全局介绍

#### 全局场景
==TransitionLayer== 用于显示过渡场景
==**[ui](#ui)**== 用于显示ui
==LootsManager== 用于管理战利品
==GlobalItemList== 用于管理所有物品

#### 全局脚本
==Global== 用于管理游戏全局的信息以及函数
==**[PlayerStats](#playerstats)**== 用于管理玩家的信息
==PlayerEffectManager== 用于管理引用于玩家身上的效果，例如扣除血量，增加血量等
==**[BagManager](#bagmanager)**== 用于管理玩家的库存系统
==TipsEmitter== 用于在窗口中显示提示信息

## Ui
#### 信号

#### 接口
==show_ui(ui:String)== 在ui中寻找名字为指定内容的节点并显示或者隐藏

==show_description(position:Vector2,item:Item)== 
使描述窗口在**position**处显示**item**的简介

==show_player_information==
通过此函数直接显示玩家的状态信息栏，会首先打开背包

==chest_open_play==
会播放开箱动画

#### 数据
==focused_ui==:String 用于存放当前聚焦的ui

## BagManager
#### 信号
==on_bag_changed== 当背包改变时发出，会在ui层修改

#### 接口
==add_item(item:Item,count:int)== 添加count个item物品进入背包
==delete_item(item:Item,count:int)->bool== 删除count个item，如果删除失败则返回false

## PlayerStats
#### 信号
==health_changed(value)== 当生命值发生改变时发出
==magic_changed(value)== 当魔力值发生改变时发出
==on_player_properties_changed(kind:Array[String],value:Array[int])== 当玩家的属性发生变化时会发射此信号，使玩家统计脚本中的信息发生改变
==on_player_stats_changed== 当玩家的统计数据发生改变时发出此信号
#### 接口

#### 数据