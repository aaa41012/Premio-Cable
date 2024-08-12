<script setup name="productInfo">
import { ref, onMounted } from 'vue'
import { useRoute } from 'vue-router'
import { categories } from './data/categories'
const route = useRoute()

const swiperItems = ref([])

const productInfo = ref(null)
const productCategory = ref('')
onMounted(() => {
  const productId = route.params.id
  productCategory.value = route.params.category
  // console.log(111, productId, productCategory.value)
  // 找到对应类别的产品
  const category = categories.find((cat) => cat.name === productCategory.value)
  if (category) {
    // 找到对应ID的产品信息
    const product = category.items.find((item) => item.id === productId)
    if (product) {
      productInfo.value = product
      // 如果产品有 images 属性，就将其赋值给 swiperItems
      if (product.images && Array.isArray(product.images)) {
        // swiperItems.value = product.images.map((img) => new URL(img, import.meta.url).href)
        swiperItems.value = product.images
        // console.log(1, swiperItems.value)
      } else if (product.images) {
        // 处理单个 image 的情况
        swiperItems.value = [new URL(product.images, import.meta.url).href]
        // console.log(2, swiperItems.value)
      }
    }
  }
})
</script>
<template>
  <div class="product-info-page">
    <el-breadcrumb separator="/">
      <!-- <el-breadcrumb-item to="/">Home</el-breadcrumb-item> -->
      <el-breadcrumb-item to="/product">Product</el-breadcrumb-item>
      <el-breadcrumb-item :to="{ path: '/product/' + productCategory }">{{
        productCategory
      }}</el-breadcrumb-item>
      <el-breadcrumb-item>{{ productInfo?.title }}</el-breadcrumb-item>
    </el-breadcrumb>
    <div class="detail">
      <!--  -->
      <el-carousel
        class="image-swiper"
        height="180px"
        pause-on-hover
        :interval="5000"
        :indicator-position="swiperItems.length <= 1 ? 'none' : ''"
      >
        <el-carousel-item v-for="(a, $i) in swiperItems" :key="$i">
          <el-image
            :src="a"
            :preview-src-list="swiperItems.map((v) => v)"
            :initial-index="$i"
            :fit="'contain'"
            preview-teleported
            hide-on-click-modal
          >
          </el-image>
        </el-carousel-item>
      </el-carousel>
    </div>
    <div>
      <div class="detail-info">
        <div class="title">{{ productInfo?.title }}</div>
        <div>Catagroy: {{ productCategory }}</div>
        <div>{{ productInfo?.description }}</div>
      </div>
    </div>
  </div>
</template>
<style scoped lang="scss">
.product-info-page {
  .el-breadcrumb {
    padding: 0 5% 5% 5%;
  }
  .detail {
    padding: 0 30%;
  }
  .detail-info {
    width: 70%;
    margin: auto;
    padding-top: 1.5rem;
    padding-bottom: 4rem;
    .title {
      font-weight: 600;
    }
  }
  .el-image {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 50%;
    margin: auto;
  }
}
//
.image-swiper {
  margin: auto;
}
::v-deep(.el-carousel__button) {
  background-color: #000;
}
::v-deep(.el-carousel__indicators--horizontal) {
  width: 100%;
  text-align: center;
}
@media (max-width: 768px) {
  .product-info-page {
    .detail {
      padding: 0;
    }
  }
}
</style>
