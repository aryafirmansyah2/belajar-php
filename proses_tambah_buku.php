<?php
    include "koneksi.php";
    if($_POST['simpan']){
        $nama_buku=$_POST['nama_buku'];
        $deskripsi=$_POST['deskripsi'];
        //upload foto
        $ekstensi = array("png","jpg","jpeg");
        $namafoto = $_FILES['foto']['name'];
        $tmp = $_FILES['foto']['tmp_name'];
        $tipe_file = pathinfo($namafoto, PATHINFO_EXTENSION);
        $ukuran = $_FILES['foto']['size'];

        if(empty($nama_buku)){
            echo "<script>alert('nama file buku tidak boleh kosong');location.href='tambah_buku.php';</script>";
        } else {
            if(!in_array($tipe_file, $ekstensi)){
                header("location:tambah_buku.php?alert=gagal_ekstensi");
            }else{
                if($ukuran < 1044070){
                    move_uploaded_file($tmp, 'assets/foto_produk/'.$namafoto);
                    $query = mysqli_query($conn," INSERT INTO buku (nama_buku, deskripsi, foto) 
                    VALUE ('".$nama_buku."', '".$deskripsi."', '".$namafoto."')");
                    if($query){
                        echo "<script>alert('Sukses menambahkan buku');location.href='buku.php';</script>";
                    } else {
                        echo "<script>alert('Gagal menambahkan buku');location.href='tambah_buku.php';</script>";
                    }
                }else{
                    echo "<script>alert('Ukuran file terlalu besar');location.href='buku.php';</script>";
                }
            }
        }
    }
?>