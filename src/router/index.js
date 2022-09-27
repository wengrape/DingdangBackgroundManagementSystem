import VueRouter from "vue-router";
import Vue from "vue"
Vue.use(VueRouter)

import MainMessage from "../view/main/MainMessage.vue"
import HomeMessage from "../components/home/HomeMessage.vue"
import PersonMessage from "../components/person/PersonMessage.vue"
import ReaderMessage from "../components/reader/ReaderMessage.vue"
import AuthorMessage from "../components/author/AuthorMessage.vue"
import BookMessageone from "../components/book/BookMessageone"
import BookMessagetwo from "../components/book/BookMessagetwo"
import BookMessagethree from "../components/book/BookMessagethree"
import PageMessageone from "../components/other/PageMessageone"
import PageMessagetwo from "../components/other/PageMessagetwo"
import VisualData from "../components/visual/VisualData.vue"
import UserMessage from "../view/user/UserMessage.vue"

import vuexData from '../store/index'

const router = new VueRouter({
    mode: "hash",
    routes: [
        {
            path: "/",
            name: "main",
            redirect: "/user",
            component: MainMessage,
            children: [
                {
                    path: "/homemessage",
                    name: "homemessage",
                    label: "首页",
                    icon: "el-icon-sunrise-1",
                    url: "HomeMessage/HomeMessage",
                    meta: { title: "首页" },
                    component: HomeMessage,
                    beforeEnter(to, from, next) {
                        if (localStorage.getItem('token') === vuexData.state.token) {    //权限控制的具体规则

                            next()
                        } else {

                            alert("验证是失败")
                        }
                    }
                },
                {
                    path: "/personmessage",
                    name: "personmessage",
                    label: "个人中心",
                    meta: { title: "个人中心" },
                    icon: "el-icon-user",
                    url: "PersonMessage/PersonMessage",
                    component: PersonMessage
                },
                {
                    path: "/readermessage",
                    name: "readermessage",
                    label: "读者管理",
                    meta: { title: "个人中心" },
                    icon: "el-icon-user",
                    url: "ReaderMessage/ReaderMessage",
                    component: ReaderMessage
                },
                {
                    path: "/authormessage",
                    name: "authormessage",
                    label: "作者管理",
                    meta: { title: "作者管理" },
                    icon: "el-icon-user",
                    url: "AuthorMessage/AuthorMessage",
                    component: AuthorMessage
                },
                {
                    path: "/bookmessageone",
                    name: "Bookmessageone",
                    label: "图书分类管理",
                    meta: { title: "图书分类管理" },
                    icon: "el-icon-message-solid",
                    url: "BookMessageOne/BookMessageOne",
                    component: BookMessageone
                },
                {
                    path: "/bookmessagetwo",
                    name: "Bookmessagetwo",
                    label: "图书借阅管理",
                    meta: { title: "图书借阅管理" },
                    icon: "el-icon-message-solid",
                    url: "BookMessageTwo/BookMessageTwo",
                    component: BookMessagetwo
                },
                {
                    path: "/bookmessagethree",
                    name: "Bookmessagethree",
                    label: "图书归还管理",
                    meta: { title: "图书归还管理" },
                    icon: "el-icon-message-solid",
                    url: "BookMessageThree/BookMessageThree",
                    component: BookMessagethree
                },
                {
                    path: "/pagemessageone",
                    name: "pagemessageone",
                    label: "页面1",
                    meta: { title: "私信平台" },
                    icon: "el-icon-message-solid",
                    url: "PageMessageOne/PageMessageOne",
                    component: PageMessageone
                },
                {
                    path: "/pagemessagetwo",
                    name: "pagemessagetwo",
                    label: "页面2",
                    meta: { title: "意见箱平台" },
                    icon: "el-icon-message-solid",
                    url: "PageMessageTwo/PageMessageTwo",
                    component: PageMessagetwo
                },
                {
                    path: "/visualdata",
                    name: "visualdata",
                    label: "可视化数据",
                    meta: { title: "数据统计" },
                    url: "VisualData/VisualData",
                    component: VisualData
                },
            ]
        },
        {
            path: "/user",
            name: "user",
            component: UserMessage,
            meta: { title: "登录与注册页面" },
        }
    ]
})

export default router