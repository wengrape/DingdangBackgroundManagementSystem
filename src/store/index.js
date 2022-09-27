import Vue from "vue"
import Vuex from "vuex"
// import becomecollapse from "./becomeCollapse"

Vue.use(Vuex)
export default new Vuex.Store({
    // modules: {
    //     becomecollapse
    // }
    mutations: {
        // 改变AsideMessage的收缩状态
        BECOMECOLLAPSE(miniState) {
            miniState.collapse = !miniState.collapse
            console.log("到了！", miniState.collapse)
        },
        // 增加面包屑数量
        ADDTOG(miniState, value) {
            const result = miniState.routerElement.findIndex(item => item.name === value.name)
            if (result === -1) {
                miniState.routerElement.push(value)
            } else {
                console.log("已有此面包屑,无法添加")
            }
        },
        // 删除面包屑数量
        CLOSETOG(miniState, value) {
            miniState.routerElement.splice(miniState.routerElement.indexOf(value), 1);
        }
    },
    state: {
        // AsideMessage的收缩状态
        collapse: false,
        // 面包屑路由收纳器
        routerElement: [
            {
                path: "/homemessage",
                name: "homemessage",
                label: "首页",
                icon: "el-icon-sunrise-1",
                url: "HomeMessage/HomeMessage",

            },
        ],
        // 获取book_lending 数据
        booklending: [],
        bookback: [],
        readermanagement: [],
        authormanagement: [],
        // 获取token值
        token: "",
        // 隐藏主题
        isTheme: false,
    }
})

