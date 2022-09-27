<template>
  <div class="thememessage">
    <el-container style="height: 100%" class="thememessage">
      <el-aside width="auto" style="height: 600px" class="thememessage">
        <AsideMessage class="thememessage" />
      </el-aside>

      <el-container>
        <el-header height="60px" class="thememessage">
          <HeaderMessage />
        </el-header>
        <TogMessage style="margin: 14px" />
        <el-main style="margin-top: 6px" class="thememessage">
          <ContextMessage class="thememessage" />
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script>
import AsideMessage from "../aside/AsideMessage.vue";
import HeaderMessage from "../header/HeaderMessage.vue";
import TogMessage from "../tog/TogMessage.vue";
import ContextMessage from "../context/ContextMessage.vue";

export default {
  name: "MainMessage",
  components: {
    AsideMessage,
    HeaderMessage,
    TogMessage,
    ContextMessage,
  },
};
</script>

<style >
.box .el-scrollbar__wrap {
  overflow-x: hidden;
}
.el-header {
  background-color: #b3c0d1;
  color: #333;
}

.el-aside {
  background-color: whitesmoke;
  color: #333;
  height: 730px;
}
html {
  background-color: whitesmoke;
}

.el-main {
  background-color: white;
  color: #333;
  text-align: center;
}
</style>