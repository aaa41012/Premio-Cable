<script setup lang="ts">
import { RouterLink, RouterView, useRouter } from 'vue-router'
import { ref, computed, watch } from 'vue'
import mail from './components/icons/mail.vue'
import burgerMenu from './components/hambuger.vue'
import { useI18n } from 'vue-i18n'

const { locale } = useI18n()
const drawer = ref(false)

const { currentRoute } = useRouter()
watch(currentRoute, () => {
  drawer.value = false
})
const changeLang = (lang: string) => {
  locale.value = lang
  console.log(1, locale.value)
  localStorage.setItem('Lang', lang)
}
const getCurrentLang = computed(() => {
  return locale.value
})
console.log('現在的語言：', getCurrentLang.value)
</script>

<template>
  <header>
    <div class="wrapper">
      <div class="logo items-center">
        <div class="logo-img mr-2">
          <img src="./assets/images/title.png" />
        </div>
        <!-- <div class="logo-name">
          <h1>世鋒實業有限公司</h1>
          <h3>PREMIO CABLE & WIRE CO., LTD</h3>
        </div> -->
      </div>
      <nav class="font-bold pc">
        <RouterLink to="/">Home</RouterLink>
        <RouterLink to="/product">Product</RouterLink>
        <RouterLink to="/contact">Contact us</RouterLink>
      </nav>
      <div class="flex pc-lang-btn">
        <button
          class="custom-button mr-2"
          :class="locale === 'zhCN' ? 'button-active' : ''"
          @click="changeLang('zhCN')"
        >
          中文
        </button>
        <button
          class="custom-button"
          :class="locale === 'enUS' ? 'button-active' : ''"
          @click="changeLang('enUS')"
        >
          English
        </button>
      </div>
      <!-- Mobile -->
      <burgerMenu class="mobile-menu" :active="drawer" @click="drawer = !drawer" />
    </div>
  </header>
  <!-- Mobile -->
  <el-drawer v-model="drawer" title="I am the title" :with-header="false" size="60%">
    <div class="logo flex items-center flex-satrt">
      <div class="logo-img mr-2">
        <img src="./assets/images/title.png" />
      </div>
      <!-- <div class="logo-name">
        <h1>世鋒實業有限公司</h1>
        <h3>PREMIO CABLE & WIRE CO., LTD</h3>
      </div> -->
    </div>
    <div class="mobile-link">
      <RouterLink to="/" class="title font-bold mail">Home</RouterLink>
      <RouterLink to="/product" class="title font-bold mail">Product</RouterLink>
      <RouterLink to="/contact" class="title font-bold mail">Contact us</RouterLink>
    </div>
    <div class="mobile-lang-btn">
      <button
        class="custom-button mr-2 normal-text"
        :class="locale === 'zhCN' ? 'button-active' : ''"
        @click="changeLang('zhCN')"
      >
        中文
      </button>
      <button
        class="custom-button normal-text"
        :class="locale === 'enUS' ? 'button-active' : ''"
        @click="changeLang('enUS')"
      >
        English
      </button>
    </div>
  </el-drawer>
  <div class="wrap-container">
    <RouterView />
  </div>
  <footer class="normal-text">
    <p>Copyright © 2024 世鋒實業有限公司 PM</p>
    <mail class="mail" />
  </footer>
</template>

<style scoped lang="scss">
header {
  width: 100%;
  position: fixed;
  z-index: 10;
  top: 0;
  border-bottom: 1px solid #ddd;
  background: $header-background;
  color: $header-text-color;
}
// .logo-name {
//   font-size: 0.8rem;
// }
.wrapper {
  width: 100%;
  @include flex;
  @include items-center;
  padding: 1%;
  .logo {
    width: 30%;
    margin: auto;
    text-align: center;
  }
  .logo-img {
    width: 200px;
    min-width: 150px;
    img {
      width: 100%;
    }
  }
  nav {
    width: 70%;
    @include flex;
    // justify-content: space-around;
    position: relative;
    a {
      white-space: nowrap;
      color: $header-text-color;
      position: relative;
      margin-right: 10vw;
      &::after {
        content: '';
        position: absolute;
        width: 0;
        height: 2px;
        display: block;
        margin-top: 5px;
        right: 0;
        background: $main-color;
        transition: width 0.3s ease;
      }
      &:hover::after {
        width: 100%;
        left: 0;
        background: $main-color;
      }
    }
  }
}
.wrap-container {
  padding-top: 6rem;
}
.mobile-link a {
  display: block;
  padding: 4% 0;
}
footer {
  @include flex;
  position: absolute;
  bottom: 0;
  width: 100%;
  background: $footer-background;
  color: $footer-text-color;
  justify-content: space-between;
  @include items-center;
  padding: 0.5vw 1vw;
  height: 30px;
}
.mobile-lang-btn {
  position: absolute;
  top: 90%;
}
// language Button
.custom-button {
  position: relative;
  min-width: 77px;
  background: transparent;
  color: rgb(165, 42, 218); /* 調整為指定的紫色 */
  text-align: center;
  text-transform: uppercase;
  text-decoration: none;
  box-sizing: inherit;
  padding: 10px 16px;
  border: 1px solid rgb(165, 42, 218); /* 調整為指定的紫色邊框 */
  box-shadow: inset 0 0 20px rgba(165, 42, 218, 0);
  outline: 1px solid !important;
  outline-color: rgba(165, 42, 218, 0.5);
  outline-offset: 0px;
  text-shadow: none;
  transition: all 1250ms cubic-bezier(0.19, 1, 0.22, 1);
}
.custom-button:hover {
  color: rgb(165, 42, 218); /* 保持紫色 */
  border: 1px solid rgb(165, 42, 218); /* 保持紫色邊框 */
  box-shadow:
    inset 0 0 20px rgba(165, 42, 218, 0.5),
    0 0 20px rgba(165, 42, 218, 0.2); /* 使用紫色的陰影 */
  outline: 1px solid !important;
  outline-color: rgba(165, 42, 218, 0) !important;
  outline-offset: 15px;
  text-shadow: 1px 1px 2px #000000; /* 黑色的文字陰影 */
}
.button-active {
  background: rgb(165, 42, 218);
  color: #fff;
  font-weight: 600;
  &:hover {
    color: #fff;
    text-shadow: 0px 0px 0px #fff; /* 調整為白色的文字陰影 */
    box-shadow:
      inset 0 0 20px rgba(255, 255, 255, 0.4),
      0 0 20px rgba(165, 42, 218, 0.2); /* 使用紫色的陰影 */
  }
}

// 手機
.pc {
  display: flex;
}
.mobile-menu {
  display: none;
}
.pc-lang-btn {
  display: flex;
}
@media (max-width: 768px) {
  .wrapper .logo {
    width: 100%;
    justify-content: center;
  }
  .pc,
  .pc-lang-btn {
    display: none !important;
  }
  .mobile-menu {
    display: block;
  }
  .custom-button {
    min-width: 47px;
  }
}
</style>
