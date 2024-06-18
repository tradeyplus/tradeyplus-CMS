import 'package:collection/collection.dart';

enum UserRole {
  INVESTOR,
  ADMINISTRATOR,
  EDITOR,
  READ_ONLY,
}

enum Package {
  GOLD,
  SILVER,
  DIAMOND,
  BRONZE,
}

enum PortfolioType {
  TRADING_PORTFOLIO,
  STOCK_PORTFOLIO,
  CUSTOM_WALLET,
}

enum TransactionType {
  PROFIT,
  COMMISSION,
  DEPOSIT,
}

enum PaymentStatus {
  DONE,
  PENDING,
}

enum LogType {
  CREATE_USER,
  UPDATE_USER,
  CREATE_INVESTMENT_DATA,
  UPDATE_INVESTMENT_DATA,
  LOGIN,
  EDIT_PROFILE,
  LOGOUT,
  UPLOAD_DOC,
  CREATE_INVESTMENT_BULK_DATA,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (UserRole):
      return UserRole.values.deserialize(value) as T?;
    case (Package):
      return Package.values.deserialize(value) as T?;
    case (PortfolioType):
      return PortfolioType.values.deserialize(value) as T?;
    case (TransactionType):
      return TransactionType.values.deserialize(value) as T?;
    case (PaymentStatus):
      return PaymentStatus.values.deserialize(value) as T?;
    case (LogType):
      return LogType.values.deserialize(value) as T?;
    default:
      return null;
  }
}
