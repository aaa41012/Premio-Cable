<script setup lang="ts">
import { ref, watch, onMounted, nextTick } from 'vue'
// 定义 props 接收父组件传递的 active 参数
const props = defineProps<{
  active: boolean
}>()
const isActive = ref(props.active)
// const noAnimation = ref(true)
// 监听 props.active 的变化
watch(
  () => props.active,
  (newVal) => {
    isActive.value = newVal
  }
)
// 切换菜单状态的方法
const toggleMenu = () => {
  isActive.value = !isActive.value
}
onMounted(async () => {
  await nextTick()
  //   noAnimation.value = false
})
</script>
<template>
  <div>
    <div id="hambuger-menu" class="hambuger-menu" :class="{ active: isActive }" @click="toggleMenu">
      <span></span>
      <span></span>
      <span></span>
    </div>
  </div>
</template>
<style scoped lang="scss">
.hambuger-menu {
  min-height: 20px;
  min-width: 30px;
  position: relative;
}
// .hamburger-menu.no-animation span {
//   animation: none !important;
// }
// .hamburger-menu.no-animation span:nth-of-type(1),
// .hamburger-menu.no-animation span:nth-of-type(2),
// .hamburger-menu.no-animation span:nth-of-type(3) {
//   animation: none !important;
// }
.hambuger-menu:hover {
  cursor: pointer;
}

.hambuger-menu span {
  width: 100%;
  height: 3px;
  background-color: #353434;
  display: block;
  position: absolute;
  border-radius: 3px;
}

.hambuger-menu span:nth-of-type(1) {
  z-index: 50;
  animation: bar-1-reverse 0.6s cubic-bezier(0.67, 0.01, 1, 0.72) forwards;
}

.hambuger-menu span:nth-of-type(2) {
  top: calc(50% - 1.6px);
  z-index: 0;
  animation: bar-2-reverse 0.6s ease-in-out forwards;
}

.hambuger-menu span:nth-of-type(3) {
  bottom: 0%;
  z-index: 100;
  animation: bar-3-reverse 0.6s cubic-bezier(0.67, 0.01, 1, 0.72) forwards;
}

.hambuger-menu.active span:nth-of-type(1) {
  animation: bar-1 0.6s cubic-bezier(0.34, 0.54, 0.57, 1) forwards;
}

.hambuger-menu.active span:nth-of-type(2) {
  animation: bar-2 0.6s ease-in-out forwards;
}

.hambuger-menu.active span:nth-of-type(3) {
  animation: bar-3 0.6s cubic-bezier(0.34, 0.54, 0.57, 1) forwards;
}

@keyframes bar-1 {
  0% {
    transform: rotate(0deg);
    top: 0;
  }
  50% {
    transform: rotate(0deg);
    top: calc(50% - 1.6px);
  }
  100% {
    transform: rotate(45deg);
    top: calc(50% - 1.6px);
  }
}

@keyframes bar-2 {
  0% {
    transform: scale(1);
    filter: opacity(1);
  }
  50% {
    transform: scale(0);
    filter: opacity(0);
  }
  100% {
    transform: scale(0);
    filter: opacity(0);
  }
}

@keyframes bar-3 {
  0% {
    transform: rotate(0deg);
    bottom: 0;
  }
  50% {
    transform: rotate(0deg);
    bottom: calc(50% - 1.6px);
  }
  100% {
    transform: rotate(135deg);
    bottom: calc(50% - 1.6px);
  }
}

/* Animations - Reverse */
@keyframes bar-1-reverse {
  0% {
    transform: rotate(45deg);
    top: calc(50% - 1.6px);
  }
  50% {
    transform: rotate(0deg);
    top: calc(50% - 1.6px);
  }
  100% {
    transform: rotate(0deg);
    top: 0;
  }
}

@keyframes bar-2-reverse {
  0% {
    transform: scale(0);
    filter: opacity(0);
  }
  50% {
    transform: scale(0);
    filter: opacity(0);
  }
  100% {
    transform: scale(1);
    filter: opacity(1);
  }
}

@keyframes bar-3-reverse {
  0% {
    transform: rotate(135deg);
    bottom: calc(50% - 1.6px);
  }
  50% {
    transform: rotate(0deg);
    bottom: calc(50% - 1.6px);
  }
  100% {
    transform: rotate(0deg);
    bottom: 0;
  }
}
</style>
