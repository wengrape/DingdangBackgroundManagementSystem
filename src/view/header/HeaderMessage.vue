<template>
  <div>
    <el-row class="row">
      <el-button
        style="font-size: 26px; margin-left: -16px; margin-right: 20px"
        :class="isCollapse ? 'el-icon-s-unfold' : 'el-icon-s-fold'"
        @click="becomeCollapse"
        class="row_button"
      ></el-button>
      <!-- 面包屑 -->
      <el-breadcrumb
        class="el-icon-arrow-right"
        v-for="(tag, index) in routerElement"
        :key="index"
        separator="/"
        style="text-decoration: none"
        id="header_breadcrumb"
      >
        <el-breadcrumb-item :to="tag.path">
          <i class="el-icon-arrow-left"></i>
          {{ tag.label }}
          <i class="el-icon-arrow-right"></i>
        </el-breadcrumb-item>
      </el-breadcrumb>

      <div class="son" id="son_span">
        <span class="h2">
          <span style="--i: 1">您好！</span>
          <span style="--i: 2">admin,</span>
          <span style="--i: 3">欢迎来到</span>
          <span style="--i: 4">叮当</span>
          <span style="--i: 5">图书网</span>
          <span style="--i: 6">后台</span>
          <span style="--i: 7">管理</span>
          <span style="--i: 8">系统!</span>
        </span>
      </div>

      <!-- 下拉框 -->
      <el-dropdown style="cursor: default" class="avatar">
        <span class="el-dropdown-link">
          <el-avatar :size="50" :src="circleUrl"></el-avatar>
        </span>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item>
            <router-link to="/personmessage" style="text-decoration: none"
              ><span @click="gainone">个人中心</span>
            </router-link>
          </el-dropdown-item>

          <el-dropdown-item>
            <router-link to="/user" style="text-decoration: none">
              <span @click="isTheme">退出</span>
            </router-link>
          </el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
      <!-- Badge -->

      <el-dropdown
        trigger="click"
        class="item"
        v-show="isCollapse ? true : false"
      >
        <span class="el-dropdown-link">
          <el-badge :value="15" :max="99">
            <el-button size="small"
              ><i class="el-icon-message" style="font-size: 26px"></i
            ></el-button>
          </el-badge>
        </span>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item class="clearfix">
            <router-link to="/pagemessageone" style="text-decoration: none">
              <span> 私信</span></router-link
            >
            <el-badge class="mark" :value="12" />
          </el-dropdown-item>
          <el-dropdown-item class="clearfix">
            <router-link to="/pagemessagetwo" style="text-decoration: none">
              <span @click="gainthree">意见箱</span></router-link
            >
            <el-badge class="mark" :value="3" />
          </el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>

      <el-dropdown
        trigger="click"
        class="item"
        v-show="isCollapse ? true : false"
      >
        <el-badge :value="15" :max="99">
          <el-button size="small"
            ><i class="el-icon-s-opportunity" style="font-size: 26px"></i
          ></el-button>
        </el-badge>
        <el-dropdown-menu slot="dropdown"> </el-dropdown-menu>
      </el-dropdown>
    </el-row>
  </div>
</template>

<script>
import { mapState } from "vuex";
export default {
  name: "HeaderMessage",
  data() {
    return {
      circleUrl: require("../../assets/ts.jpg"),
      person: {
        path: "/personmessage",
        name: "personmessage",
        label: "个人中心",
        icon: "el-icon-video-play",
        url: "PersonMessage/PersonMessage",
      },
      pageone: {
        path: "/pagemessageone",
        name: "pagemessageone",
        label: "私信",
        icon: "el-icon-message-solid",
        url: "PageMessageOne/PageMessageOne",
      },
      pagetwo: {
        path: "/pagemessagetwo",
        name: "pagemessagetwo",
        label: "意见箱",
        icon: "el-icon-message-solid",
        url: "PageMessageTwo/PageMessageTwo",
      },
    };
  },
  methods: {
    isTheme() {
      this.$store.state.isTheme = false;
      console.log("isTheme", this.$store.state.isTheme);
    },
    becomeCollapse() {
      // this.$store.commit("becomecollapse/BECOMECOLLAPSE");
      this.$store.commit("BECOMECOLLAPSE");
    },
    gainone() {
      this.$store.commit("ADDTOG", this.person);
    },
    gaintwo() {
      this.$store.commit("ADDTOG", this.pageone);
    },
    gainthree() {
      this.$store.commit("ADDTOG", this.pagetwo);
    },
  },
  computed: {
    ...mapState({ isCollapse: ["collapse"] }),
    ...mapState({ routerElement: "routerElement" }),

    // return this.$store.becomecollapse
  },
};
</script>

<style>
#becomeCollapse {
  margin: 10px;
}
#son_span {
  z-index: -100;
}
.row_button {
  position: relative;
  top: 4px;
  left: 10px;
}
.avatar {
  position: relative;
  top: -47px;
  right: -1100px;
}
#header_breadcrumb {
  z-index: 100;
}
* {
  margin: 0px;
  padding: 0px;
}

.son {
  display: flex;
  justify-content: center;
  align-items: center;
  background: pank;
  box-sizing: border-box;
  font-family: "Bod Script", cursive;
}
.h2 {
  display: flex;
  color: transparent;
  font-size: 30px;
  margin-top: -40px;
}
.h2 span {
  animation: animate 3s linear infinite;
  animation-delay: calc(0.1s * var(--i));
}
@keyframes animate {
  0% {
    color: white;
    filter: blur(2px) hue-rotate(0deg);
    text-shadow: 0 0 10px blue, 0 0 20px blue, 0 0 40px blue, 0 0 80px blue,
      0 0 120px blue, 0 0 200px blue, 0 0 300px blue, 0 0 800px blue;
  }
  30%,
  70% {
    color: white;
    filter: blur(2px) hue-rotate(360deg);
    text-shadow: 0 0 10px blue, 0 0 20px blue, 0 0 40px blue, 0 0 80px blue,
      0 0 120px blue, 0 0 200px blue;
  }
  100% {
    color: transparent;
    box-shadow: none;
    filter: blur(2px) hue-rotate(0deg);
  }
}

.item {
  position: relative;
  top: -67px;
  right: -1190px;
  margin-top: 10px;
  margin-right: 40px;
}
</style>