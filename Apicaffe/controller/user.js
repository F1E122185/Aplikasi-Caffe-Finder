const bcrypt = require('bcrypt');
const userModel = require('../model/user');
const response = require('../config/response');
const user = require('../model/user');

exports.registrasi = (data) =>
    new Promise((resolve, reject) => {
        //console.log(data)
        userModel.findOne({userName: data.userName})
            .then(user => {
                if(user){
                    resolve(response.commonErrorMsg('Username sudah digunakan'))
                }else{
                    bcrypt.hash(data.password, 10, (err, hash) => {
                        if (err){
                            reject(response.commonErrorMsg)
                        }else{
                            data.password = hash
                            userModel.create(data)
                            .then(() => resolve(response.commonSuccessMsg('Berhasil registrasi')))
                            .catch(()=> reject (response.commonErrorMsg('Mohon Maaf Registrasi Gagal')))
                        }
                    })
                }
            }).catch(() => reject(response.commonError))
    })

exports.login = (data) =>
    new Promise((resolve, reject) => {
        userModel.findOne({
            userName: data.userName  // Ganti userModel dengan userName
        }).then(user => {
            if (user) {
                if (bcrypt.compareSync(data.password, user.password)) {
                    resolve(response.commonResult(user));
                } else {
                    reject(response.commonErrorMsg('Password salah'));
                }
            } else {
                reject(response.commonErrorMsg('Username tidak ditemukan'));
            }
        }).catch(() => reject(response.commonError));
    });
