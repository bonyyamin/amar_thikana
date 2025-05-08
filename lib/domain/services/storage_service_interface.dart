abstract class StorageServiceInterface {
  /// Initializes the storage service.
  /// Returns [true] if initialization is successful, [false] otherwise.
  Future<bool> initialize();

  /// Stores a value with the given [key].
  /// Returns [true] if the operation is successful, [false] otherwise.
  Future<bool> setValue(String key, dynamic value);

  /// Retrieves a value for the given [key].
  /// Returns [null] if the key doesn't exist.
  Future<dynamic> getValue(String key);

  /// Removes a value with the given [key].
  /// Returns [true] if the operation is successful, [false] otherwise.
  Future<bool> removeValue(String key);

  /// Checks if a key exists in storage.
  /// Returns [true] if the key exists, [false] otherwise.
  Future<bool> hasKey(String key);

  /// Clears all stored values.
  /// Returns [true] if the operation is successful, [false] otherwise.
  Future<bool> clearAll();

  /// Gets all keys stored in the storage.
  /// Returns a [Set] of keys.
  Future<Set<String>> getKeys();
  
  /// Stores an object by serializing it to JSON.
  /// The [key] is used to identify the object.
  /// The [object] must be JSON serializable.
  /// Returns [true] if the operation is successful, [false] otherwise.
  Future<bool> setObject<T>(String key, T object);
  
  /// Retrieves an object by deserializing it from JSON.
  /// The [key] is used to identify the object.
  /// The [fromJson] function is used to convert JSON to an object.
  /// Returns the deserialized object or [null] if not found.
  Future<T?> getObject<T>(String key, T Function(Map<String, dynamic> json) fromJson);
}