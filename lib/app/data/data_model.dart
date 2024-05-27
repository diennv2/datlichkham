class ThanhPho {
  int? id;
  String? name;
  String? code;

  ThanhPho({this.id, this.name, this.code});
}

class QuanHuyen {
  int? id;
  String? name;
  String? prefix;
  int? provinceId;

  QuanHuyen({
    this.id,
    this.name,
    this.prefix,
    this.provinceId,
  });
}

class PhuongXa {
  int? id;
  String? name;
  String? prefix;
  int? provinceId;
  int? districtId;

  PhuongXa({this.id, this.name, this.prefix, this.provinceId, this.districtId});
}

final dataThanhPho = <ThanhPho>[
  ThanhPho(id: 0, name: "Không xác định", code: "00"),
  ThanhPho(id: 21, name: "Hải Dương", code: "HD")
];

final dataQuanHuyen = <QuanHuyen>[
  QuanHuyen(id: 0, name: "Không xác định", prefix: "", provinceId: 0),
  QuanHuyen(id: 287, name: "Bình Giang", prefix: "Huyện", provinceId: 21),
  QuanHuyen(id: 288, name: "Cẩm Giàng", prefix: "Huyện", provinceId: 21),
  QuanHuyen(id: 289, name: "Chí Linh", prefix: "Thị xã", provinceId: 21),
  QuanHuyen(id: 290, name: "Gia Lộc", prefix: "Huyện", provinceId: 21),
  QuanHuyen(id: 291, name: "Hải Dương", prefix: "Thành phố", provinceId: 21),
  QuanHuyen(id: 292, name: "Kim Thành", prefix: "Huyện", provinceId: 21),
  QuanHuyen(id: 293, name: "Kinh Môn", prefix: "Huyện", provinceId: 21),
  QuanHuyen(id: 294, name: "Nam Sách", prefix: "Huyện", provinceId: 21),
  QuanHuyen(id: 295, name: "Ninh Giang", prefix: "Huyện", provinceId: 21),
  QuanHuyen(id: 296, name: "Thanh Hà", prefix: "Huyện", provinceId: 21),
  QuanHuyen(id: 297, name: "Thanh Miện", prefix: "Huyện", provinceId: 21),
  QuanHuyen(id: 298, name: "Tứ Kỳ", prefix: "Huyện", provinceId: 21),
];
final dataPhuongXa = <PhuongXa>[
  PhuongXa(
      id: 0, name: "Không xác định", prefix: "", provinceId: 0, districtId: 0),
  PhuongXa(
      id: 4431,
      name: "Bình Minh",
      prefix: "Xã",
      provinceId: 21,
      districtId: 287),
  PhuongXa(
      id: 4432,
      name: "Bình Xuyên",
      prefix: "Xã",
      provinceId: 21,
      districtId: 287),
  PhuongXa(
      id: 4433, name: "Cổ Bi", prefix: "Xã", provinceId: 21, districtId: 287),
  PhuongXa(
      id: 4434,
      name: "Hồng Khê",
      prefix: "Xã",
      provinceId: 21,
      districtId: 287),
  PhuongXa(
      id: 4435,
      name: "Hùng Thắng",
      prefix: "Xã",
      provinceId: 21,
      districtId: 287),
  PhuongXa(
      id: 4436,
      name: "Hưng Thịnh",
      prefix: "Xã",
      provinceId: 21,
      districtId: 287),
  PhuongXa(
      id: 4437,
      name: "Kẻ Sặt",
      prefix: "Thị trấn",
      provinceId: 21,
      districtId: 287),
  PhuongXa(
      id: 4438,
      name: "Long Xuyên",
      prefix: "Xã",
      provinceId: 21,
      districtId: 287),
  PhuongXa(
      id: 4439,
      name: "Nhân Quyền",
      prefix: "Xã",
      provinceId: 21,
      districtId: 287),
  PhuongXa(
      id: 4440,
      name: "Tân Hồng",
      prefix: "Xã",
      provinceId: 21,
      districtId: 287),
  PhuongXa(
      id: 4441,
      name: "Tân Việt",
      prefix: "Xã",
      provinceId: 21,
      districtId: 287),
  PhuongXa(
      id: 4442,
      name: "Thái Dương",
      prefix: "Xã",
      provinceId: 21,
      districtId: 287),
  PhuongXa(
      id: 4443,
      name: "Thái Hòa",
      prefix: "Xã",
      provinceId: 21,
      districtId: 287),
  PhuongXa(
      id: 4444,
      name: "Thái Học",
      prefix: "Xã",
      provinceId: 21,
      districtId: 287),
  PhuongXa(
      id: 4445,
      name: "Thúc Kháng",
      prefix: "Xã",
      provinceId: 21,
      districtId: 287),
  PhuongXa(
      id: 4446,
      name: "Tráng Liệt",
      prefix: "Xã",
      provinceId: 21,
      districtId: 287),
  PhuongXa(
      id: 4447,
      name: "Vĩnh Hồng",
      prefix: "Xã",
      provinceId: 21,
      districtId: 287),
  PhuongXa(
      id: 4448,
      name: "Vĩnh Tuy",
      prefix: "Xã",
      provinceId: 21,
      districtId: 287),
  PhuongXa(
      id: 4449,
      name: "Cẩm Điền",
      prefix: "Xã",
      provinceId: 21,
      districtId: 288),
  PhuongXa(
      id: 4450,
      name: "Cẩm Định",
      prefix: "Xã",
      provinceId: 21,
      districtId: 288),
  PhuongXa(
      id: 4451,
      name: "Cẩm Đoài",
      prefix: "Xã",
      provinceId: 21,
      districtId: 288),
  PhuongXa(
      id: 4452,
      name: "Cẩm Đông",
      prefix: "Xã",
      provinceId: 21,
      districtId: 288),
  PhuongXa(
      id: 4453,
      name: "Cẩm Giàng",
      prefix: "Thị trấn",
      provinceId: 21,
      districtId: 288),
  PhuongXa(
      id: 4454,
      name: "Cẩm Hoàng",
      prefix: "Xã",
      provinceId: 21,
      districtId: 288),
  PhuongXa(
      id: 4455,
      name: "Cẩm Hưng",
      prefix: "Xã",
      provinceId: 21,
      districtId: 288),
  PhuongXa(
      id: 4456,
      name: "Cẩm Phúc",
      prefix: "Xã",
      provinceId: 21,
      districtId: 288),
  PhuongXa(
      id: 4457, name: "Cẩm Sơn", prefix: "Xã", provinceId: 21, districtId: 288),
  PhuongXa(
      id: 4458, name: "Cẩm Văn", prefix: "Xã", provinceId: 21, districtId: 288),
  PhuongXa(
      id: 4459, name: "Cẩm Vũ", prefix: "Xã", provinceId: 21, districtId: 288),
  PhuongXa(
      id: 4460, name: "Cao An", prefix: "Xã", provinceId: 21, districtId: 288),
  PhuongXa(
      id: 4461,
      name: "Đức Chính",
      prefix: "Xã",
      provinceId: 21,
      districtId: 288),
  PhuongXa(
      id: 4462,
      name: "Kim Giang",
      prefix: "Xã",
      provinceId: 21,
      districtId: 288),
  PhuongXa(
      id: 4463,
      name: "Lai Cách",
      prefix: "Thị trấn",
      provinceId: 21,
      districtId: 288),
  PhuongXa(
      id: 4464,
      name: "Lương Điền",
      prefix: "Xã",
      provinceId: 21,
      districtId: 288),
  PhuongXa(
      id: 4465,
      name: "Ngọc Liên",
      prefix: "Xã",
      provinceId: 21,
      districtId: 288),
  PhuongXa(
      id: 4466,
      name: "Tân Trường",
      prefix: "Xã",
      provinceId: 21,
      districtId: 288),
  PhuongXa(
      id: 4467,
      name: "Thạch Lỗi",
      prefix: "Xã",
      provinceId: 21,
      districtId: 288),
  PhuongXa(
      id: 4468, name: "An Lạc", prefix: "Xã", provinceId: 21, districtId: 289),
  PhuongXa(
      id: 4469,
      name: "Bắc An",
      prefix: "Phường",
      provinceId: 21,
      districtId: 289),
  PhuongXa(
      id: 4470,
      name: "Bến Tắm",
      prefix: "Phường",
      provinceId: 21,
      districtId: 289),
  PhuongXa(
      id: 4471,
      name: "Chí Minh",
      prefix: "Phường",
      provinceId: 21,
      districtId: 289),
  PhuongXa(
      id: 4472,
      name: "Cổ Thành",
      prefix: "Xã",
      provinceId: 21,
      districtId: 289),
  PhuongXa(
      id: 4473,
      name: "Cộng Hòa",
      prefix: "Phường",
      provinceId: 21,
      districtId: 289),
  PhuongXa(
      id: 4474,
      name: "Đồng Lạc",
      prefix: "Xã",
      provinceId: 21,
      districtId: 289),
  PhuongXa(
      id: 4475,
      name: "Hoàng Hoa Thám",
      prefix: "Phường",
      provinceId: 21,
      districtId: 289),
  PhuongXa(
      id: 4476,
      name: "Hoàng Tân",
      prefix: "Phường",
      provinceId: 21,
      districtId: 289),
  PhuongXa(
      id: 4477,
      name: "Hoàng Tiến",
      prefix: "Xã",
      provinceId: 21,
      districtId: 289),
  PhuongXa(
      id: 4478,
      name: "Hưng Đạo",
      prefix: "Xã",
      provinceId: 21,
      districtId: 289),
  PhuongXa(
      id: 4479,
      name: "Kênh Giang",
      prefix: "Xã",
      provinceId: 21,
      districtId: 289),
  PhuongXa(
      id: 4480,
      name: "Lê Lợi",
      prefix: "Phường",
      provinceId: 21,
      districtId: 289),
  PhuongXa(
      id: 4481,
      name: "Nhân Huệ",
      prefix: "Xã",
      provinceId: 21,
      districtId: 289),
  PhuongXa(
      id: 4482,
      name: "Phả Lại",
      prefix: "Phường",
      provinceId: 21,
      districtId: 289),
  PhuongXa(
      id: 4483,
      name: "Sao Đỏ",
      prefix: "Phường",
      provinceId: 21,
      districtId: 289),
  PhuongXa(
      id: 4484, name: "Tân Dân", prefix: "Xã", provinceId: 21, districtId: 289),
  PhuongXa(
      id: 4485,
      name: "Thái Học",
      prefix: "Phường",
      provinceId: 21,
      districtId: 289),
  PhuongXa(
      id: 4486,
      name: "Văn An",
      prefix: "Phường",
      provinceId: 21,
      districtId: 289),
  PhuongXa(
      id: 4487, name: "Văn Đức", prefix: "Xã", provinceId: 21, districtId: 289),
  PhuongXa(
      id: 4488,
      name: "Đoàn Thượng",
      prefix: "Xã",
      provinceId: 21,
      districtId: 290),
  PhuongXa(
      id: 4489,
      name: "Đồng Quang",
      prefix: "Xã",
      provinceId: 21,
      districtId: 290),
  PhuongXa(
      id: 4490,
      name: "Đức Xương",
      prefix: "Xã",
      provinceId: 21,
      districtId: 290),
  PhuongXa(
      id: 4491, name: "Gia Hòa", prefix: "Xã", provinceId: 21, districtId: 290),
  PhuongXa(
      id: 4492,
      name: "Gia Khánh",
      prefix: "Xã",
      provinceId: 21,
      districtId: 290),
  PhuongXa(
      id: 4493,
      name: "Gia Lộc",
      prefix: "Thị trấn",
      provinceId: 21,
      districtId: 290),
  PhuongXa(
      id: 4494,
      name: "Gia Lương",
      prefix: "Xã",
      provinceId: 21,
      districtId: 290),
  PhuongXa(
      id: 4495, name: "Gia Tân", prefix: "Xã", provinceId: 21, districtId: 290),
  PhuongXa(
      id: 4496,
      name: "Gia Xuyên",
      prefix: "Xã",
      provinceId: 21,
      districtId: 290),
  PhuongXa(
      id: 4497,
      name: "Hoàng Diệu",
      prefix: "Xã",
      provinceId: 21,
      districtId: 290),
  PhuongXa(
      id: 4498,
      name: "Hồng Hưng",
      prefix: "Xã",
      provinceId: 21,
      districtId: 290),
  PhuongXa(
      id: 4499, name: "Lê Lợi", prefix: "Xã", provinceId: 21, districtId: 290),
  PhuongXa(
      id: 4500,
      name: "Liên Hồng",
      prefix: "Xã",
      provinceId: 21,
      districtId: 290),
  PhuongXa(
      id: 4501,
      name: "Nhật Tân",
      prefix: "Xã",
      provinceId: 21,
      districtId: 290),
  PhuongXa(
      id: 4502,
      name: "Phạm Trấn",
      prefix: "Xã",
      provinceId: 21,
      districtId: 290),
  PhuongXa(
      id: 4503,
      name: "Phương Hưng",
      prefix: "Xã",
      provinceId: 21,
      districtId: 290),
  PhuongXa(
      id: 4504,
      name: "Quang Minh",
      prefix: "Xã",
      provinceId: 21,
      districtId: 290),
  PhuongXa(
      id: 4505,
      name: "Tân Tiến",
      prefix: "Xã",
      provinceId: 21,
      districtId: 290),
  PhuongXa(
      id: 4506,
      name: "Thống Kênh",
      prefix: "Xã",
      provinceId: 21,
      districtId: 290),
  PhuongXa(
      id: 4507,
      name: "Thống Nhất",
      prefix: "Xã",
      provinceId: 21,
      districtId: 290),
  PhuongXa(
      id: 4508,
      name: "Toàn Thắng",
      prefix: "Xã",
      provinceId: 21,
      districtId: 290),
  PhuongXa(
      id: 4509,
      name: "Trùng Khánh",
      prefix: "Xã",
      provinceId: 21,
      districtId: 290),
  PhuongXa(
      id: 4510,
      name: "Yết Kiêu",
      prefix: "Xã",
      provinceId: 21,
      districtId: 290),
  PhuongXa(
      id: 4511, name: "Ái Quốc", prefix: "Xã", provinceId: 21, districtId: 291),
  PhuongXa(
      id: 4512, name: "An Châu", prefix: "Xã", provinceId: 21, districtId: 291),
  PhuongXa(
      id: 4513,
      name: "Bình Hàn",
      prefix: "Phường",
      provinceId: 21,
      districtId: 291),
  PhuongXa(
      id: 4514,
      name: "Cẩm Thượng",
      prefix: "Phường",
      provinceId: 21,
      districtId: 291),
  PhuongXa(
      id: 4515,
      name: "Hải Tân",
      prefix: "Phường",
      provinceId: 21,
      districtId: 291),
  PhuongXa(
      id: 4516,
      name: "Lê Thanh Nghị",
      prefix: "Phường",
      provinceId: 21,
      districtId: 291),
  PhuongXa(
      id: 4517,
      name: "Nam Đồng",
      prefix: "Xã",
      provinceId: 21,
      districtId: 291),
  PhuongXa(
      id: 4518,
      name: "Ngọc Châu",
      prefix: "Phường",
      provinceId: 21,
      districtId: 291),
  PhuongXa(
      id: 4519,
      name: "Nguyễn Trãi",
      prefix: "Phường",
      provinceId: 21,
      districtId: 291),
  PhuongXa(
      id: 4520,
      name: "Nhị Châu",
      prefix: "Phường",
      provinceId: 21,
      districtId: 291),
  PhuongXa(
      id: 4521,
      name: "Phạm Ngũ Lão",
      prefix: "Phường",
      provinceId: 21,
      districtId: 291),
  PhuongXa(
      id: 4522,
      name: "Quang Trung",
      prefix: "Phường",
      provinceId: 21,
      districtId: 291),
  PhuongXa(
      id: 4523,
      name: "Tân Bình",
      prefix: "Phường",
      provinceId: 21,
      districtId: 291),
  PhuongXa(
      id: 4524,
      name: "Tân Hưng",
      prefix: "Xã",
      provinceId: 21,
      districtId: 291),
  PhuongXa(
      id: 4525,
      name: "Thạch Khôi",
      prefix: "Xã",
      provinceId: 21,
      districtId: 291),
  PhuongXa(
      id: 4526,
      name: "Thanh Bình",
      prefix: "Phường",
      provinceId: 21,
      districtId: 291),
  PhuongXa(
      id: 4527,
      name: "Thượng Đạt",
      prefix: "Xã",
      provinceId: 21,
      districtId: 291),
  PhuongXa(
      id: 4528,
      name: "Trần Hưng Đạo",
      prefix: "Phường",
      provinceId: 21,
      districtId: 291),
  PhuongXa(
      id: 4529,
      name: "Trần Phú",
      prefix: "Phường",
      provinceId: 21,
      districtId: 291),
  PhuongXa(
      id: 4530,
      name: "Tứ Minh",
      prefix: "Phường",
      provinceId: 21,
      districtId: 291),
  PhuongXa(
      id: 4531,
      name: "Việt Hòa",
      prefix: "Phường",
      provinceId: 21,
      districtId: 291),
  PhuongXa(
      id: 4532,
      name: "Bình Dân",
      prefix: "Xã",
      provinceId: 21,
      districtId: 292),
  PhuongXa(
      id: 4533, name: "Cẩm La", prefix: "Xã", provinceId: 21, districtId: 292),
  PhuongXa(
      id: 4534, name: "Cổ Dũng", prefix: "Xã", provinceId: 21, districtId: 292),
  PhuongXa(
      id: 4535,
      name: "Cộng Hòa",
      prefix: "Xã",
      provinceId: 21,
      districtId: 292),
  PhuongXa(
      id: 4536, name: "Đại Đức", prefix: "Xã", provinceId: 21, districtId: 292),
  PhuongXa(
      id: 4537,
      name: "Đồng Gia",
      prefix: "Xã",
      provinceId: 21,
      districtId: 292),
  PhuongXa(
      id: 4538, name: "Kim Anh", prefix: "Xã", provinceId: 21, districtId: 292),
  PhuongXa(
      id: 4539,
      name: "Kim Đính",
      prefix: "Xã",
      provinceId: 21,
      districtId: 292),
  PhuongXa(
      id: 4540, name: "Kim Khê", prefix: "Xã", provinceId: 21, districtId: 292),
  PhuongXa(
      id: 4541,
      name: "Kim Lương",
      prefix: "Xã",
      provinceId: 21,
      districtId: 292),
  PhuongXa(
      id: 4542, name: "Kim Tân", prefix: "Xã", provinceId: 21, districtId: 292),
  PhuongXa(
      id: 4543,
      name: "Kim Xuyên",
      prefix: "Xã",
      provinceId: 21,
      districtId: 292),
  PhuongXa(
      id: 4544, name: "Lai Vu", prefix: "Xã", provinceId: 21, districtId: 292),
  PhuongXa(
      id: 4545,
      name: "Liên Hòa",
      prefix: "Xã",
      provinceId: 21,
      districtId: 292),
  PhuongXa(
      id: 4546,
      name: "Ngũ Phúc",
      prefix: "Xã",
      provinceId: 21,
      districtId: 292),
  PhuongXa(
      id: 4547,
      name: "Phú Thái",
      prefix: "Thị trấn",
      provinceId: 21,
      districtId: 292),
  PhuongXa(
      id: 4548,
      name: "Phúc Thành A",
      prefix: "Xã",
      provinceId: 21,
      districtId: 292),
  PhuongXa(
      id: 4549, name: "Tam Kỳ", prefix: "Xã", provinceId: 21, districtId: 292),
  PhuongXa(
      id: 4550,
      name: "Thượng Vũ",
      prefix: "Xã",
      provinceId: 21,
      districtId: 292),
  PhuongXa(
      id: 4551,
      name: "Tuấn Hưng",
      prefix: "Xã",
      provinceId: 21,
      districtId: 292),
  PhuongXa(
      id: 4552,
      name: "Việt Hưng",
      prefix: "Xã",
      provinceId: 21,
      districtId: 292),
  PhuongXa(
      id: 4553, name: "An Phụ", prefix: "Xã", provinceId: 21, districtId: 293),
  PhuongXa(
      id: 4554, name: "An Sinh", prefix: "Xã", provinceId: 21, districtId: 293),
  PhuongXa(
      id: 4555,
      name: "Bạch Đằng",
      prefix: "Xã",
      provinceId: 21,
      districtId: 293),
  PhuongXa(
      id: 4556, name: "Duy Tân", prefix: "Xã", provinceId: 21, districtId: 293),
  PhuongXa(
      id: 4557,
      name: "Hiến Thành",
      prefix: "Xã",
      provinceId: 21,
      districtId: 293),
  PhuongXa(
      id: 4558, name: "Hiệp An", prefix: "Xã", provinceId: 21, districtId: 293),
  PhuongXa(
      id: 4559,
      name: "Hiệp Hòa",
      prefix: "Xã",
      provinceId: 21,
      districtId: 293),
  PhuongXa(
      id: 4560,
      name: "Hiệp Sơn",
      prefix: "Xã",
      provinceId: 21,
      districtId: 293),
  PhuongXa(
      id: 4561,
      name: "Hoành Sơn",
      prefix: "Xã",
      provinceId: 21,
      districtId: 293),
  PhuongXa(
      id: 4562,
      name: "Hưng Đạo",
      prefix: "Xã",
      provinceId: 21,
      districtId: 293),
  PhuongXa(
      id: 4563,
      name: "Kinh Môn",
      prefix: "Thị trấn",
      provinceId: 21,
      districtId: 293),
  PhuongXa(
      id: 4564,
      name: "Lạc Long",
      prefix: "Xã",
      provinceId: 21,
      districtId: 293),
  PhuongXa(
      id: 4565, name: "Lê Ninh", prefix: "Xã", provinceId: 21, districtId: 293),
  PhuongXa(
      id: 4566,
      name: "Long Xuyên",
      prefix: "Xã",
      provinceId: 21,
      districtId: 293),
  PhuongXa(
      id: 4567,
      name: "Minh Hòa",
      prefix: "Xã",
      provinceId: 21,
      districtId: 293),
  PhuongXa(
      id: 4568,
      name: "Minh Tân",
      prefix: "Thị trấn",
      provinceId: 21,
      districtId: 293),
  PhuongXa(
      id: 4569,
      name: "Phạm Mệnh",
      prefix: "Xã",
      provinceId: 21,
      districtId: 293),
  PhuongXa(
      id: 4570,
      name: "Phú Thứ",
      prefix: "Thị trấn",
      provinceId: 21,
      districtId: 293),
  PhuongXa(
      id: 4571,
      name: "Phúc Thành B",
      prefix: "Xã",
      provinceId: 21,
      districtId: 293),
  PhuongXa(
      id: 4572,
      name: "Quang Trung",
      prefix: "Xã",
      provinceId: 21,
      districtId: 293),
  PhuongXa(
      id: 4573, name: "Tân Dân", prefix: "Xã", provinceId: 21, districtId: 293),
  PhuongXa(
      id: 4574,
      name: "Thái Hòa",
      prefix: "Xã",
      provinceId: 21,
      districtId: 293),
  PhuongXa(
      id: 4575,
      name: "Thái Sơn",
      prefix: "Xã",
      provinceId: 21,
      districtId: 293),
  PhuongXa(
      id: 4576,
      name: "Thái Thịnh",
      prefix: "Xã",
      provinceId: 21,
      districtId: 293),
  PhuongXa(
      id: 4577,
      name: "Thăng Long",
      prefix: "Xã",
      provinceId: 21,
      districtId: 293),
  PhuongXa(
      id: 4578,
      name: "Thất Hùng",
      prefix: "Xã",
      provinceId: 21,
      districtId: 293),
  PhuongXa(
      id: 4579,
      name: "Thượng Quận",
      prefix: "Xã",
      provinceId: 21,
      districtId: 293),
  PhuongXa(
      id: 4580, name: "An Bình", prefix: "Xã", provinceId: 21, districtId: 294),
  PhuongXa(
      id: 4581, name: "An Lâm", prefix: "Xã", provinceId: 21, districtId: 294),
  PhuongXa(
      id: 4582, name: "An Sơn", prefix: "Xã", provinceId: 21, districtId: 294),
  PhuongXa(
      id: 4583,
      name: "Cộng Hòa",
      prefix: "Xã",
      provinceId: 21,
      districtId: 294),
  PhuongXa(
      id: 4584,
      name: "Đồng Lạc",
      prefix: "Xã",
      provinceId: 21,
      districtId: 294),
  PhuongXa(
      id: 4585,
      name: "Hiệp Cát",
      prefix: "Xã",
      provinceId: 21,
      districtId: 294),
  PhuongXa(
      id: 4586,
      name: "Hồng Phong",
      prefix: "Xã",
      provinceId: 21,
      districtId: 294),
  PhuongXa(
      id: 4587,
      name: "Hợp Tiến",
      prefix: "Xã",
      provinceId: 21,
      districtId: 294),
  PhuongXa(
      id: 4588,
      name: "Minh Tân",
      prefix: "Xã",
      provinceId: 21,
      districtId: 294),
  PhuongXa(
      id: 4589,
      name: "Nam Chính",
      prefix: "Xã",
      provinceId: 21,
      districtId: 294),
  PhuongXa(
      id: 4590,
      name: "Nam Hồng",
      prefix: "Xã",
      provinceId: 21,
      districtId: 294),
  PhuongXa(
      id: 4591,
      name: "Nam Hưng",
      prefix: "Xã",
      provinceId: 21,
      districtId: 294),
  PhuongXa(
      id: 4592,
      name: "Nam Sách",
      prefix: "Thị trấn",
      provinceId: 21,
      districtId: 294),
  PhuongXa(
      id: 4593, name: "Nam Tân", prefix: "Xã", provinceId: 21, districtId: 294),
  PhuongXa(
      id: 4594,
      name: "Nam Trung",
      prefix: "Xã",
      provinceId: 21,
      districtId: 294),
  PhuongXa(
      id: 4595,
      name: "Phú Điền",
      prefix: "Xã",
      provinceId: 21,
      districtId: 294),
  PhuongXa(
      id: 4596,
      name: "Quốc Tuấn",
      prefix: "Xã",
      provinceId: 21,
      districtId: 294),
  PhuongXa(
      id: 4597,
      name: "Thái Tân",
      prefix: "Xã",
      provinceId: 21,
      districtId: 294),
  PhuongXa(
      id: 4598,
      name: "Thanh Quang",
      prefix: "Xã",
      provinceId: 21,
      districtId: 294),
  PhuongXa(
      id: 4599, name: "An Đức", prefix: "Xã", provinceId: 21, districtId: 295),
  PhuongXa(
      id: 4600,
      name: "Đồng Tâm",
      prefix: "Xã",
      provinceId: 21,
      districtId: 295),
  PhuongXa(
      id: 4601,
      name: "Đông Xuyên",
      prefix: "Xã",
      provinceId: 21,
      districtId: 295),
  PhuongXa(
      id: 4602,
      name: "Hiệp Lực",
      prefix: "Xã",
      provinceId: 21,
      districtId: 295),
  PhuongXa(
      id: 4603,
      name: "Hoàng Hanh",
      prefix: "Xã",
      provinceId: 21,
      districtId: 295),
  PhuongXa(
      id: 4604, name: "Hồng Dụ", prefix: "Xã", provinceId: 21, districtId: 295),
  PhuongXa(
      id: 4605,
      name: "Hồng Đức",
      prefix: "Xã",
      provinceId: 21,
      districtId: 295),
  PhuongXa(
      id: 4606,
      name: "Hồng Phong",
      prefix: "Xã",
      provinceId: 21,
      districtId: 295),
  PhuongXa(
      id: 4607,
      name: "Hồng Phúc",
      prefix: "Xã",
      provinceId: 21,
      districtId: 295),
  PhuongXa(
      id: 4608,
      name: "Hồng Thái",
      prefix: "Xã",
      provinceId: 21,
      districtId: 295),
  PhuongXa(
      id: 4609,
      name: "Hưng Long",
      prefix: "Xã",
      provinceId: 21,
      districtId: 295),
  PhuongXa(
      id: 4610,
      name: "Hưng Thái",
      prefix: "Xã",
      provinceId: 21,
      districtId: 295),
  PhuongXa(
      id: 4611,
      name: "Kiến Quốc",
      prefix: "Xã",
      provinceId: 21,
      districtId: 295),
  PhuongXa(
      id: 4612,
      name: "Nghĩa An",
      prefix: "Xã",
      provinceId: 21,
      districtId: 295),
  PhuongXa(
      id: 4613,
      name: "Ninh Giang",
      prefix: "Thị trấn",
      provinceId: 21,
      districtId: 295),
  PhuongXa(
      id: 4614,
      name: "Ninh Hải",
      prefix: "Xã",
      provinceId: 21,
      districtId: 295),
  PhuongXa(
      id: 4615,
      name: "Ninh Hoà",
      prefix: "Xã",
      provinceId: 21,
      districtId: 295),
  PhuongXa(
      id: 4616,
      name: "Ninh Thành",
      prefix: "Xã",
      provinceId: 21,
      districtId: 295),
  PhuongXa(
      id: 4617,
      name: "Quang Hưng",
      prefix: "Xã",
      provinceId: 21,
      districtId: 295),
  PhuongXa(
      id: 4618,
      name: "Quyết Thắng",
      prefix: "Xã",
      provinceId: 21,
      districtId: 295),
  PhuongXa(
      id: 4619,
      name: "Tân Hương",
      prefix: "Xã",
      provinceId: 21,
      districtId: 295),
  PhuongXa(
      id: 4620,
      name: "Tân Phong",
      prefix: "Xã",
      provinceId: 21,
      districtId: 295),
  PhuongXa(
      id: 4621,
      name: "Tân Quang",
      prefix: "Xã",
      provinceId: 21,
      districtId: 295),
  PhuongXa(
      id: 4622, name: "Ứng Hoè", prefix: "Xã", provinceId: 21, districtId: 295),
  PhuongXa(
      id: 4623,
      name: "Văn Giang",
      prefix: "Xã",
      provinceId: 21,
      districtId: 295),
  PhuongXa(
      id: 4624, name: "Văn Hội", prefix: "Xã", provinceId: 21, districtId: 295),
  PhuongXa(
      id: 4625,
      name: "Vạn Phúc",
      prefix: "Xã",
      provinceId: 21,
      districtId: 295),
  PhuongXa(
      id: 4626,
      name: "Vĩnh Hoà",
      prefix: "Xã",
      provinceId: 21,
      districtId: 295),
  PhuongXa(
      id: 4627,
      name: "An Lương",
      prefix: "Xã",
      provinceId: 21,
      districtId: 296),
  PhuongXa(
      id: 4628, name: "Cẩm Chế", prefix: "Xã", provinceId: 21, districtId: 296),
  PhuongXa(
      id: 4629,
      name: "Hồng Lạc",
      prefix: "Xã",
      provinceId: 21,
      districtId: 296),
  PhuongXa(
      id: 4630, name: "Hợp Đức", prefix: "Xã", provinceId: 21, districtId: 296),
  PhuongXa(
      id: 4631,
      name: "Liên Mạc",
      prefix: "Xã",
      provinceId: 21,
      districtId: 296),
  PhuongXa(
      id: 4632,
      name: "Phượng Hoàng",
      prefix: "Xã",
      provinceId: 21,
      districtId: 296),
  PhuongXa(
      id: 4633,
      name: "Quyết Thắng",
      prefix: "Xã",
      provinceId: 21,
      districtId: 296),
  PhuongXa(
      id: 4634, name: "Tân An", prefix: "Xã", provinceId: 21, districtId: 296),
  PhuongXa(
      id: 4635,
      name: "Tân Việt",
      prefix: "Xã",
      provinceId: 21,
      districtId: 296),
  PhuongXa(
      id: 4636,
      name: "Thanh An",
      prefix: "Xã",
      provinceId: 21,
      districtId: 296),
  PhuongXa(
      id: 4637,
      name: "Thanh Bính",
      prefix: "Xã",
      provinceId: 21,
      districtId: 296),
  PhuongXa(
      id: 4638,
      name: "Thanh Cường",
      prefix: "Xã",
      provinceId: 21,
      districtId: 296),
  PhuongXa(
      id: 4639,
      name: "Thanh Hà",
      prefix: "Xã",
      provinceId: 21,
      districtId: 296),
  PhuongXa(
      id: 4640,
      name: "Thanh Hải",
      prefix: "Xã",
      provinceId: 21,
      districtId: 296),
  PhuongXa(
      id: 4641,
      name: "Thanh Hồng",
      prefix: "Xã",
      provinceId: 21,
      districtId: 296),
  PhuongXa(
      id: 4642,
      name: "Thanh Khê",
      prefix: "Xã",
      provinceId: 21,
      districtId: 296),
  PhuongXa(
      id: 4643,
      name: "Thanh Lang",
      prefix: "Xã",
      provinceId: 21,
      districtId: 296),
  PhuongXa(
      id: 4644,
      name: "Thanh Sơn",
      prefix: "Xã",
      provinceId: 21,
      districtId: 296),
  PhuongXa(
      id: 4645,
      name: "Thanh Thuỷ",
      prefix: "Xã",
      provinceId: 21,
      districtId: 296),
  PhuongXa(
      id: 4646,
      name: "Thanh Xá",
      prefix: "Xã",
      provinceId: 21,
      districtId: 296),
  PhuongXa(
      id: 4647,
      name: "Thanh Xuân",
      prefix: "Xã",
      provinceId: 21,
      districtId: 296),
  PhuongXa(
      id: 4648,
      name: "Tiền Tiến",
      prefix: "Xã",
      provinceId: 21,
      districtId: 296),
  PhuongXa(
      id: 4649,
      name: "Trường Thành",
      prefix: "Xã",
      provinceId: 21,
      districtId: 296),
  PhuongXa(
      id: 4650,
      name: "Việt Hồng",
      prefix: "Xã",
      provinceId: 21,
      districtId: 296),
  PhuongXa(
      id: 4651,
      name: "Vĩnh Lập",
      prefix: "Xã",
      provinceId: 21,
      districtId: 296),
  PhuongXa(
      id: 4652,
      name: "Cao Thắng",
      prefix: "Xã",
      provinceId: 21,
      districtId: 297),
  PhuongXa(
      id: 4653,
      name: "Chi Lăng Bắc",
      prefix: "Xã",
      provinceId: 21,
      districtId: 297),
  PhuongXa(
      id: 4654,
      name: "Chi Lăng Nam",
      prefix: "Xã",
      provinceId: 21,
      districtId: 297),
  PhuongXa(
      id: 4655,
      name: "Diên Hồng",
      prefix: "Xã",
      provinceId: 21,
      districtId: 297),
  PhuongXa(
      id: 4656,
      name: "Đoàn Kết",
      prefix: "Xã",
      provinceId: 21,
      districtId: 297),
  PhuongXa(
      id: 4657,
      name: "Đoàn Tùng",
      prefix: "Xã",
      provinceId: 21,
      districtId: 297),
  PhuongXa(
      id: 4658,
      name: "Hồng Quang",
      prefix: "Xã",
      provinceId: 21,
      districtId: 297),
  PhuongXa(
      id: 4659,
      name: "Hùng Sơn",
      prefix: "Xã",
      provinceId: 21,
      districtId: 297),
  PhuongXa(
      id: 4660, name: "Lam Sơn", prefix: "Xã", provinceId: 21, districtId: 297),
  PhuongXa(
      id: 4661, name: "Lê Hồng", prefix: "Xã", provinceId: 21, districtId: 297),
  PhuongXa(
      id: 4662,
      name: "Ngô Quyền",
      prefix: "Xã",
      provinceId: 21,
      districtId: 297),
  PhuongXa(
      id: 4663,
      name: "Ngũ Hùng",
      prefix: "Xã",
      provinceId: 21,
      districtId: 297),
  PhuongXa(
      id: 4664,
      name: "Phạm Kha",
      prefix: "Xã",
      provinceId: 21,
      districtId: 297),
  PhuongXa(
      id: 4665,
      name: "Tân Trào",
      prefix: "Xã",
      provinceId: 21,
      districtId: 297),
  PhuongXa(
      id: 4666,
      name: "Thanh Giang",
      prefix: "Xã",
      provinceId: 21,
      districtId: 297),
  PhuongXa(
      id: 4667,
      name: "Thanh Miện",
      prefix: "Thị trấn",
      provinceId: 21,
      districtId: 297),
  PhuongXa(
      id: 4668,
      name: "Thanh Tùng",
      prefix: "Xã",
      provinceId: 21,
      districtId: 297),
  PhuongXa(
      id: 4669,
      name: "Tiền Phong",
      prefix: "Xã",
      provinceId: 21,
      districtId: 297),
  PhuongXa(
      id: 4670,
      name: "Tứ Cường",
      prefix: "Xã",
      provinceId: 21,
      districtId: 297),
  PhuongXa(
      id: 4671,
      name: "An Thanh",
      prefix: "Xã",
      provinceId: 21,
      districtId: 298),
  PhuongXa(
      id: 4672,
      name: "Bình Lãng",
      prefix: "Xã",
      provinceId: 21,
      districtId: 298),
  PhuongXa(
      id: 4673,
      name: "Cộng Lạc",
      prefix: "Xã",
      provinceId: 21,
      districtId: 298),
  PhuongXa(
      id: 4674,
      name: "Đại Đồng",
      prefix: "Xã",
      provinceId: 21,
      districtId: 298),
  PhuongXa(
      id: 4675, name: "Đại Hợp", prefix: "Xã", provinceId: 21, districtId: 298),
  PhuongXa(
      id: 4676, name: "Dân Chủ", prefix: "Xã", provinceId: 21, districtId: 298),
  PhuongXa(
      id: 4677, name: "Đông Kỳ", prefix: "Xã", provinceId: 21, districtId: 298),
  PhuongXa(
      id: 4678, name: "Hà Kỳ", prefix: "Xã", provinceId: 21, districtId: 298),
  PhuongXa(
      id: 4679,
      name: "Hà Thanh",
      prefix: "Xã",
      provinceId: 21,
      districtId: 298),
  PhuongXa(
      id: 4680,
      name: "Hưng Đạo",
      prefix: "Xã",
      provinceId: 21,
      districtId: 298),
  PhuongXa(
      id: 4681, name: "Kỳ Sơn", prefix: "Xã", provinceId: 21, districtId: 298),
  PhuongXa(
      id: 4682,
      name: "Minh Đức",
      prefix: "Xã",
      provinceId: 21,
      districtId: 298),
  PhuongXa(
      id: 4683, name: "Ngọc Kỳ", prefix: "Xã", provinceId: 21, districtId: 298),
  PhuongXa(
      id: 4684,
      name: "Ngọc Sơn",
      prefix: "Xã",
      provinceId: 21,
      districtId: 298),
  PhuongXa(
      id: 4685,
      name: "Nguyên Giáp",
      prefix: "Xã",
      provinceId: 21,
      districtId: 298),
  PhuongXa(
      id: 4686,
      name: "Phượng Kỳ",
      prefix: "Xã",
      provinceId: 21,
      districtId: 298),
  PhuongXa(
      id: 4687,
      name: "Quang Khải",
      prefix: "Xã",
      provinceId: 21,
      districtId: 298),
  PhuongXa(
      id: 4688,
      name: "Quảng Nghiệp",
      prefix: "Xã",
      provinceId: 21,
      districtId: 298),
  PhuongXa(
      id: 4689,
      name: "Quang Phục",
      prefix: "Xã",
      provinceId: 21,
      districtId: 298),
  PhuongXa(
      id: 4690,
      name: "Quang Trung",
      prefix: "Xã",
      provinceId: 21,
      districtId: 298),
  PhuongXa(
      id: 4691, name: "Tái Sơn", prefix: "Xã", provinceId: 21, districtId: 298),
  PhuongXa(
      id: 4692, name: "Tân Kỳ", prefix: "Xã", provinceId: 21, districtId: 298),
  PhuongXa(
      id: 4693, name: "Tây Kỳ", prefix: "Xã", provinceId: 21, districtId: 298),
  PhuongXa(
      id: 4694,
      name: "Tiên Động",
      prefix: "Xã",
      provinceId: 21,
      districtId: 298),
  PhuongXa(
      id: 4695,
      name: "Tứ Kỳ",
      prefix: "Thị trấn",
      provinceId: 21,
      districtId: 298),
  PhuongXa(
      id: 4696,
      name: "Tứ Xuyên",
      prefix: "Xã",
      provinceId: 21,
      districtId: 298),
  PhuongXa(
      id: 4697, name: "Văn Tố", prefix: "Xã", provinceId: 21, districtId: 298),
];
