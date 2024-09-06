interface Message {
    /**
     * 状态码
     */
    code: 0 | 1;
    /**
     * 消息
     */
    message: string;
}

interface PageConfig {
    /**
     * 商品落地页
     */
    url: string;
    /**
     * 回跳 URL Scheme，可选字段
     */
    backURL?: string;
}

export default class PddISV {
    /**
     * 初始化
     */
    static init(): Promise<Message>;

    /**
     * 获取设备指纹
     */
    static getPati(): Promise<Message>;

    /**
     * 唤起拼多多，并跳转到落地页
     */
    static openPDDWithURL(params: PageConfig): Promise<Message>;
}
