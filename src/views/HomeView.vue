<script setup lang="ts">
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import mail from './../components/icons/mail.vue'
const img = ref([
  new URL('./../assets/images/slider-1.jpg', import.meta.url).href,
  new URL('./../assets/images/slider-2.jpg', import.meta.url).href,
  new URL('./../assets/images/slider-3.jpg', import.meta.url).href,
  new URL('./../assets/images/slider-4.jpg', import.meta.url).href
])
const router = useRouter()
const goToContact = () => {
  router.push({
    name: 'contact'
  })
}
</script>
<template>
  <div class="home-container">
    <el-carousel indicator-position="none" :interval="5000" type="card">
      <el-carousel-item v-for="item in img" :key="item">
        <img :src="item" />
      </el-carousel-item>
    </el-carousel>
    <section class="middle items-center">
      <div class="middle-img flex justify-center">
        <iframe
          src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3615.332280335437!2d121.41359937609894!3d25.02279523874137!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442a78942976879%3A0x615c6fe313fa66a6!2zMjQy5paw5YyX5biC5paw6I6K5Y2A5Lit5q2j6Lev5paw5pe65be3MzLomZ8!5e0!3m2!1szh-TW!2stw!4v1721619485580!5m2!1szh-TW!2stw"
          width="600"
          height="450"
          border="0"
          allowfullscreen=""
          loading="lazy"
          referrerpolicy="no-referrer-when-downgrade"
        ></iframe>
      </div>
      <div class="middle-text normal-text" @click="goToContact()">
        <p class="font-bold title">Company profile & Contact us</p>
        <p>Taiwan Office:</p>
        <p>
          No. 32, Hsin Wang Lane, Chung Cheng Rd., Hsin Wang Lane, Chung Cheng Rd., Taipei 242,
          Taiwan, R.O.C.
        </p>
        <p>Tel: (886-2) 2904-0722-3, 2902-0645</p>
        <p>Fax: (886-2) 2903-8277</p>
        <p class="flex items-center url-text">
          mail:angela@premiocable.com.tw
          <a href="mailto:angela@premiocable.com.tw"><mail class="mail ml-2 black-fill" /></a>
        </p>
        <p class="flex items-center url-text">
          johnson@premiocable.com.tw
          <a href="mailto:johnson@premiocable.com.tw">
            <mail class="mail ml-2 black-fill" />
          </a>
        </p>
        <p>
          <a href="http://www.premiocable.com.tw"> http://www.premiocable.com.tw </a>
        </p>
      </div>
    </section>
  </div>
</template>
<style scoped lang="scss">
.home-container {
  padding: 0 10%;
}
.el-carousel__item h3 {
  color: #475669;
  opacity: 0.75;
  line-height: 200px;
  margin: 0;
  text-align: center;
}
.el-carousel__item:nth-child(2n) img {
  // background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n + 1) img {
  // background-color: #d3dce6;
}
.el-carousel__indicator--horizontal {
  width: 5%;
}
.el-carousel__item--card {
  // background-color: rgba(153, 169, 191, 0.1);
  text-align: center;
  // margin: auto;
}
iframe {
  margin-right: 1rem;
  border: 0 !important;
}
.middle {
  @include flex;
  @include justify-center;
  padding: 3vw 0 7vw 0;
  .middle-img {
    width: 60%;
    min-width: 30%;
    padding: 1%;
    @include flex;
    @include items-center;
  }
  .middle-text {
    width: 40%;
    min-width: 50%;
    line-height: 1.6rem;
  }
}
@media (max-width: 768px) {
  .is-active {
    // top: 10px;
  }
  .middle {
    display: flex;
    flex-direction: column-reverse;
    padding-bottom: 10vw;
    .middle-img {
      width: 100%;
    }
    .middle-text {
      width: 100%;
      text-align: center;
      justify-content: center;
    }
    .url-text {
      justify-content: center;
    }
  }
}

@media (max-width: 400px) {
  ::v-deep(.el-carousel__arrow) {
    top: 53%;
  }
  ::v-deep(.el-carousel__arrow--right) {
    right: 0;
  }
  ::v-deep(.el-carousel__arrow--left) {
    left: 0;
  }
  .el-carousel {
    height: 180px;
  }
}
</style>
