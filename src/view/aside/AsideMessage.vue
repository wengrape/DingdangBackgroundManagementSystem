<template>
  <div style="height: 100%; width: 100%" class="thememessage">
    <AsideOne class="thememessage" />

    <el-menu
      default-active="2"
      class="el-menu-vertical-demo thememessage"
      @open="handleOpen"
      @close="handleClose"
      :collapse="isCollapse"
    >
      <!-- 没有children的menuList -->
      <el-menu-item
        index="2"
        v-for="n in nochildren"
        :key="n.name"
        class="thememessage"
      >
        <!-- 切换路由 -->
        <router-link :to="n.path" style="text-decoration: none; color: black">
          <i :class="n.icon"></i>
          <span @click="gain(n)">{{ n.label }}</span>
        </router-link>
      </el-menu-item>
      <!-- 有children的menuList -->

      <el-submenu
        index="2"
        v-for="h in haschildren"
        :key="h.name"
        class="thememessage"
      >
        <template slot="title">
          <i :class="h.icon"></i>
          <span slot="title">{{ h.label }}</span>
        </template>
        <el-menu-item-group
          v-for="(c, index) in h.children"
          :key="index"
          class="thememessage"
        >
          <el-menu-item index="1-1">
            <!-- 切换路由 -->
            <router-link
              :to="c.path"
              style="text-decoration: none; color: black"
            >
              <i :class="c.icon"></i>
              <span @click="gain(c)">{{ c.label }}</span>
            </router-link>
          </el-menu-item>
        </el-menu-item-group>
      </el-submenu>
    </el-menu>
  </div>
</template>

<script>
import AsideOne from "../../components/AsideOne.vue";
import { mapState } from "vuex";
export default {
  name: "AsideMessage",
  components: { AsideOne },
  data() {
    return {
      // isCollapse: this.$store.state.collapse,
      menuList: [
        {
          path: "/homemessage",
          name: "homemessage",
          label: "首页",
          icon: "el-icon-sunrise-1",
          url: "HomeMessage/HomeMessage",
        },
        {
          path: "/personmessage",
          name: "personmessage",
          label: "个人中心",
          icon: "el-icon-video-play",
          url: "PersonMessage/PersonMessage",
        },
        {
          path: "/readermessage",
          name: "readermessage",
          label: "读者管理",
          icon: "el-icon-s-custom",
          url: "ReaderMessage/ReaderMessage",
        },
        {
          path: "/authormessage",
          name: "authormessage",
          label: "作者管理",
          icon: "el-icon-video-play",
          url: "AuthorMessage/AuthorMessage",
        },
        {
          name: "Bookmassege",
          label: "图书管理",
          icon: "el-icon-s-custom",
          url: "UserMessage/UserMessage",
          path: "/",
          children: [
            {
              path: "/bookmessageone",
              name: "Bookmessageone",
              label: "图书分类管理",
              icon: "el-icon-message-solid",
              url: "BookMessageOne/BookMessageOne",
            },
            {
              path: "/bookmessagetwo",
              name: "Bookmessagetwo",
              label: "图书借阅管理",
              icon: "el-icon-message-solid",
              url: "BookMessageTwo/BookMessageTwo",
            },
            {
              path: "/bookmessagethree",
              name: "Bookmessagethree",
              label: "图书归还管理",
              icon: "el-icon-message-solid",
              url: "BookMessageThree/BookMessageThree",
            },
          ],
        },
        {
          label: "其他",
          name: "othermessage",
          icon: "el-icon-location",
          path: "/",
          children: [
            {
              path: "/pagemessageone",
              name: "pagemessageone",
              label: "私信",
              icon: "el-icon-message-solid",
              url: "PageMessageOne/PageMessageOne",
            },
            {
              path: "/pagemessagetwo",
              name: "pagemessagetwo",
              label: "意见箱",
              icon: "el-icon-message-solid",
              url: "PageMessageTwo/PageMessageTwo",
            },
          ],
        },
      ],
    };
  },
  methods: {
    handleOpen(key, keyPath) {
      console.log(key, keyPath);
    },
    handleClose(key, keyPath) {
      console.log(key, keyPath);
    },
    // 获取路由元素
    gain(e) {
      this.$store.commit("ADDTOG", e);
    },
  },
  computed: {
    ...mapState({ isCollapse: "collapse" }),
    // <!-- 没有children的menuList -->
    nochildren() {
      return this.menuList.filter((m) => !m.children);
    },
    // <!-- 有children的menuList -->
    haschildren() {
      return this.menuList.filter((m) => m.children);
    },
  },
  // mounted() {
  //   console.log(
  //     "this.$store.state.routerElement:",
  //     this.$store.state.routerElement
  //   );
  // },
};
</script>

<style>
.el-menu-vertical-demo:not(.el-menu--collapse) {
  width: 296px;
  min-height: 600px;
  background-color: whitesmoke;
}
</style>