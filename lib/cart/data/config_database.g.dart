// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CocktailCartDao? _cartCocktailDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `CartCocktail` (`id` TEXT NOT NULL, `cocktailName` TEXT NOT NULL, `cocktailCategory` TEXT NOT NULL, `cocktailUrlImage` TEXT, `cocktailPrice` INTEGER NOT NULL, `quantity` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CocktailCartDao get cartCocktailDao {
    return _cartCocktailDaoInstance ??=
        _$CocktailCartDao(database, changeListener);
  }
}

class _$CocktailCartDao extends CocktailCartDao {
  _$CocktailCartDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _cartCocktailInsertionAdapter = InsertionAdapter(
            database,
            'CartCocktail',
            (CartCocktail item) => <String, Object?>{
                  'id': item.id,
                  'cocktailName': item.cocktailName,
                  'cocktailCategory': item.cocktailCategory,
                  'cocktailUrlImage': item.cocktailUrlImage,
                  'cocktailPrice': item.cocktailPrice,
                  'quantity': item.quantity
                }),
        _cartCocktailUpdateAdapter = UpdateAdapter(
            database,
            'CartCocktail',
            ['id'],
            (CartCocktail item) => <String, Object?>{
                  'id': item.id,
                  'cocktailName': item.cocktailName,
                  'cocktailCategory': item.cocktailCategory,
                  'cocktailUrlImage': item.cocktailUrlImage,
                  'cocktailPrice': item.cocktailPrice,
                  'quantity': item.quantity
                }),
        _cartCocktailDeletionAdapter = DeletionAdapter(
            database,
            'CartCocktail',
            ['id'],
            (CartCocktail item) => <String, Object?>{
                  'id': item.id,
                  'cocktailName': item.cocktailName,
                  'cocktailCategory': item.cocktailCategory,
                  'cocktailUrlImage': item.cocktailUrlImage,
                  'cocktailPrice': item.cocktailPrice,
                  'quantity': item.quantity
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CartCocktail> _cartCocktailInsertionAdapter;

  final UpdateAdapter<CartCocktail> _cartCocktailUpdateAdapter;

  final DeletionAdapter<CartCocktail> _cartCocktailDeletionAdapter;

  @override
  Future<List<CartCocktail>> findAllCocktails() async {
    return _queryAdapter.queryList('SELECT * FROM CartCocktail',
        mapper: (Map<String, Object?> row) => CartCocktail(
            row['id'] as String,
            row['cocktailName'] as String,
            row['cocktailCategory'] as String,
            row['cocktailUrlImage'] as String?,
            row['cocktailPrice'] as int,
            row['quantity'] as int));
  }

  @override
  Future<CartCocktail?> deleteCocktail() async {
    return _queryAdapter.query('DELETE FROM CartCocktail',
        mapper: (Map<String, Object?> row) => CartCocktail(
            row['id'] as String,
            row['cocktailName'] as String,
            row['cocktailCategory'] as String,
            row['cocktailUrlImage'] as String?,
            row['cocktailPrice'] as int,
            row['quantity'] as int));
  }

  @override
  Future<void> insertCocktail(CartCocktail cartCocktail) async {
    await _cartCocktailInsertionAdapter.insert(
        cartCocktail, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateCocktail(CartCocktail cartCocktail) async {
    await _cartCocktailUpdateAdapter.update(
        cartCocktail, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteCartCocktail(CartCocktail cartCocktail) async {
    await _cartCocktailDeletionAdapter.delete(cartCocktail);
  }
}
