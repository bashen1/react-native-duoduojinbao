import {NativeModules} from 'react-native';

const {RNReactNativeDuoduoJinbao} = NativeModules;

class DuoduoJinbao {
    static init = async () => {
        return await RNReactNativeDuoduoJinbao.init({});
    };

    static getPati = async () => {
        return await RNReactNativeDuoduoJinbao.getPati({});
    }

    static openPDDWithURL = async params => {
        return await RNReactNativeDuoduoJinbao.openPDDWithURL(params ?? {});
    }
}

export default DuoduoJinbao;
