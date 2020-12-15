import enum


class BangCap(enum.Enum):
    TuTai = "Tú Tài"
    TrungCap = "Trung Cấp"
    CaoDang = "Cao Đẳng"
    DaiHoc = "Đại Học"
    ThacSi = "Thạc Sĩ"
    TienSi = "Tiến Sĩ"


class BoPhan(enum.Enum):
    ThuThu = "Thủ Thư"
    ThuKho = "Thủ Kho"
    ThuQuy = "Thủ Quỹ"
    BanGiamDoc = "Ban Giám Đốc"


class ChucVu(enum.Enum):
    GiamDoc = "Giám Đốc"
    PhoGiamDoc = "Phó Giám Đốc"
    TruongPhong = "Trưởng Phòng"
    PhoPhong = "Phó Phòng"
    NhanVien = "Nhân Viên"


class TheLoaiSach(enum.Enum):
    ChinhTri = "Chính Trị - Pháp Luật"
    KhoaHoc = "Khoa Học Công Nghệ - Kinh Tế"
    VanHoa = "Văn Hóa Xã Hội - Lịch Sử"
    VanHoc = "Văn Học Nghệ Thuật"
    GiaoTrinh = "Giáo Trình"
    Truyen = "Truyện - Tiểu Thuyết"
    TamLy = "Tâm Lý, Tâm Linh, Tôn Giáo"
    ThieuNhi = "Sách Thiếu Nhi"
    Khac = "Khác"



class LoaiDocGia(enum.Enum):
    DocGiaX = "X"
    DocGiaY = "Y"


class TinhTrang(enum.Enum):
    Tontai = "Tồn tại"
    KhongTonTai = "Không tồn tại"
    DangDuocMuon = "Đang được mượn"
    DaThanhLy = "Đã thanh lý"


class LyDoThanhLy(enum.Enum):
    Mat = "Mất"
    HuHong = "Hư hỏng"
    NguoiDungLamMat = "Người dùng làm mất"