import { createI18n } from 'vue-i18n'
import enUS from './en-US/index'
import zhCN from './zh-CN/index'
// 準備翻譯數據
const messages = {
  enUS: {
    ...enUS
  },
  zhCN: {
    ...zhCN
  }
}
const defaultLang = (): string => {
  const lang = localStorage.getItem('Lang')
  return lang ? lang : 'enUS'
}
const i18n = createI18n({
  locale: defaultLang(), // 預設語言
  legacy: false,
  globalInjection: true,
  messages
})
export default i18n
