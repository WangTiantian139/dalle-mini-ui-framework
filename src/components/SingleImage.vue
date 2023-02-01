<template>
  <el-row justify="center">
    <el-image
      :src="imageUrl"
      v-if="loadingStatus !== LoadingStatus.idle"
      v-loading="loadingStatus === LoadingStatus.loading"
      fit="contain"
      class="image-row"
    >
      <template #error>
        <div
          v-if="loadingStatus === LoadingStatus.loading"
          class="image-slot"
        />
        <div
          v-else-if="loadingStatus === LoadingStatus.error"
          class="image-slot"
        >
          <el-icon><warning /></el-icon>
        </div>
      </template>
    </el-image>
  </el-row>
</template>

<script setup lang="ts">
import LoadingStatus from "./LoadingStatus";
import { Warning } from "@element-plus/icons-vue";

interface Props {
  loadingStatus: LoadingStatus;
  imageUrl: string;
}

const props = defineProps<Props>();
</script>

<style>
.image-row {
  min-height: 100px;
  /* max-height: 512px; */
  width: 512px;
}
.image-row .image-slot {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 100%;
  background: var(--el-fill-color-light);
  color: var(--el-text-color-secondary);
  font-size: 30px;
}
.image-row .image-slot .el-icon {
  font-size: 30px;
}
</style>
