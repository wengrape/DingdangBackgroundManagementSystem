import Vue from 'vue'
import App from './App.vue'
// vuex 的引入
import store from './store/index';
// element-ui 的样式引入
import 'element-ui/lib/theme-chalk/index.css';

// 路由的引入
import router from './router';

// axios 发出请求
import axios from 'axios';

// element-ui 按需引入
import {
  Container, Aside, Header, Main,
  RadioGroup, RadioButton, Menu, Submenu, MenuItemGroup, MenuItem,
  Row, Button, Card,
  Breadcrumb, BreadcrumbItem, DropdownMenu, DropdownItem, Dropdown, Avatar, Badge,
  Tag, Drawer,
  Carousel, CarouselItem,
  Table, TableColumn, Popover, Form, FormItem, Input, Pagination, Select, Option,
  Switch, Progress, Tooltip, DatePicker, TimePicker, CheckboxGroup, Radio, Checkbox,
  Col,
} from "element-ui"

// 引入 echarts 核心模块，核心模块提供了 echarts 使用必须要的接口。
import * as echarts from 'echarts/core';
// 引入图表，图表后缀都为 Chart
import { BarChart } from 'echarts/charts';
import { PieChart } from 'echarts/charts';
import { LineChart } from 'echarts/charts';
// 引入提示框，标题，直角坐标系，数据集，内置数据转换器组件，组件后缀都为 Component
import {
  TitleComponent,
  TooltipComponent,
  GridComponent,
  DatasetComponent,
  TransformComponent,
  LegendComponent,
} from 'echarts/components';
// 标签自动布局，全局过渡动画等特性
import { LabelLayout, UniversalTransition } from 'echarts/features';
// 引入 Canvas 渲染器，注意引入 CanvasRenderer 或者 SVGRenderer 是必须的一步
import { CanvasRenderer } from 'echarts/renderers';


// 注册必须的组件
echarts.use([
  TitleComponent,
  TooltipComponent,
  GridComponent,
  DatasetComponent,
  TransformComponent,
  BarChart,
  LabelLayout,
  UniversalTransition,
  CanvasRenderer,
  PieChart,
  LineChart,
  LegendComponent,
]);

// 关闭警告
Vue.config.productionTip = false
Vue.config.silent = true

// App.vue theme的开关
Vue.use(Switch)

// MainMessage.vue 需要 element-ui 的元素 布局
Vue.use(Container)
Vue.use(Aside)
Vue.use(Header)
Vue.use(Main)

// AsideMessage.vue 需要 element-ui 的元素 菜单栏
Vue.use(RadioGroup)
Vue.use(RadioButton)
Vue.use(Menu)
Vue.use(Submenu)
Vue.use(MenuItemGroup)
Vue.use(MenuItem)

// HeaderMessage.vue 需要 element-ui 的元素 按钮
Vue.use(Row)
Vue.use(Button)
Vue.use(Breadcrumb)
Vue.use(BreadcrumbItem)

Vue.use(DropdownMenu)

Vue.use(DropdownItem)
Vue.use(Dropdown)
Vue.use(Avatar)
Vue.use(Badge)
Vue.use(Card)

// TogMessage.vue 需要 element-ui 的元素 面包屑
Vue.use(Tag)
Vue.use(Drawer)

// HomeMessage.vue 需要 element-ui 的元素 走马灯效果
Vue.use(Carousel)
Vue.use(CarouselItem)
Vue.use(Col)

// BookMessageone.vue 需要 element-ui 的元素 表格 表单

Vue.use(Table)
Vue.use(TableColumn)
Vue.use(Popover)
Vue.use(Form)
Vue.use(FormItem)
Vue.use(Input)
Vue.use(Pagination)

// BookMessagethree.vue 需要 element-ui 的元素

Vue.use(Select)
Vue.use(Option)

// PersonMessage.vue 需要的元素
Vue.use(Progress)
Vue.use(Tooltip)
Vue.use(DatePicker)
Vue.use(TimePicker)
Vue.use(CheckboxGroup)
Vue.use(Radio)
Vue.use(Checkbox)


// router.beforeEach((to, from, next) => {
//   store.commit('getToken')
//   const token = store.state.token
//   if (!token && to.name !== 'login') {
//     next({ name: 'login' })

//   } else {
//     next()
//   }
// })

router.afterEach((to) => {

  if (to.meta.title) {
    document.title = to.meta.title
  } else {
    document.title = "叮当网后台管理系统"
  }
})


// axios做全局事件总线
Vue.prototype.$axios = axios
//echarts做全局事件总线
Vue.prototype.$echarts = echarts

new Vue({
  render: h => h(App),
  // vuex
  store,
  // 路由
  router,


  mounted() {
    console.log("VueThis:", this)
    console.log(
      "this.$store.state.routerElement:",
      this.$store.state.routerElement
    );
  },
}).$mount('#app')
