<template>
  <div id="tog">
    <el-tag
      v-for="(tag, index) in routerElement"
      :key="index"
      :closable="tag.name == 'homemessage' ? false : true"
      :type="tag.type"
      :effect="$route.name === tag.name ? 'dark' : 'plain'"
      style="margin-left: 4px"
      @close="togClose(tag, index)"
    >
      <router-link
        :to="tag.path"
        style="
          text-decoration: none;
          color: black;
          margin-left: 2px;
          color: black;
        "
      >
        {{ tag.label }}
      </router-link>
    </el-tag>

    <el-button
      @click="becomeDrawer"
      type="primary"
      style="margin-left: 70px; width: 60px; height: 50px; border-radius: 50%"
      show-close="false"
      close-on-press-escape="true"
      class="share-button"
      icon="el-icon-setting"
    >
    </el-button>

    <el-drawer
      title="我是标题"
      :visible.sync="drawer"
      :with-header="false"
      @click="becomeDrawer"
      ref="drawer_el"
      :close-on-click-modal="false"
      :wrapper-closable="true"
      :modal-append-to-body="false"
    >
      <!-- :modal="false" -->
      <span style="font-size: 100px">祝你每天都开开心心！</span>
      <!-- <span @select="closeOne">关闭!</span> -->
    </el-drawer>
  </div>
</template>

<script>
import { mapState } from "vuex";
export default {
  name: "TogMessage",
  data() {
    return {
      drawer: false,
    };
  },
  computed: {
    ...mapState({ routerElement: "routerElement" }),
  },
  methods: {
    becomeDrawer() {
      this.drawer = !this.drawer;
    },
    // closeOne() {
    //   this.$refs.drawer_el.closeDrawer();
    //   // this.$confirm("还有未保存的工作哦确定关闭吗？")
    //   //   .then(() => {
    //   //     done();
    //   //   })
    //   //   .catch(() => {});
    // },
    togClose(tag, index) {
      this.$store.commit("CLOSETOG", tag);
      const length = this.routerElement.length - 1;

      if (tag.name !== this.$route.name) {
        console.log("1");
        return;
      }
      if (index === length) {
        console.log("2");
        this.$router.push({
          name: this.routerElement[index].name,
        });
      } else {
        console.log("3");
        this.$router.push({
          name: this.routerElement[index - 1].name,
        });
      }
    },
  },
};
</script>

<style scoped>
#tog {
  z-index: 100;
}
</style>