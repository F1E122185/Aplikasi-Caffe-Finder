module.exports= {

    comonError: {
        error: true,
        msg : 'Terjadi Kesalahan pada Server'
    },
    commonErrorMsg:(msg) => {
        return {
            error: true,
            msg : msg
        }
    },
    comonSuccess: {
        error: false,
        msg : 'Berhasil Memuat Pemintaan' 
    },
    commonSuccessMsg:(msg) => {
        return {
            error: false,
            msg : msg
        }
    },
    commonResult: (data) => {
        return {
            error: false,
            msg : 'Berhasil Memmuat data',
            data : data
        } 
    }
};