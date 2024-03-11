const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.newCloudFunction = functions.https.onCall(async (data, context) => {
  // Here you can enforce security rules, like checking if the caller is an admin, if necessary

  // Destructure the data object to extract all user fields
  const {
    email,
    password, // Used for Auth user creation
    display_name,
    photo_url,
    phone_number,
    user_role,
    nationality,
    note,
    risk_ratio,
    package,
    address,
    evaluation,
    points,
    balance,
    investment_period,
    yield_period,
    dob, // Ensure this is a proper date or timestamp before using
    payment_status,
    last_read_notification,
    // Any other fields you expect to receive...
  } = data;

  // Input validation can be performed here

  try {
    // Create the Auth user
    const userRecord = await admin.auth().createUser({
      email,
      password,
      displayName: display_name,
      photoURL: photo_url,
      phoneNumber: phone_number,
    });

    // Set additional user attributes that are not part of the default Auth user profile
    // as custom claims (if you have such requirements):
    // await admin.auth().setCustomUserClaims(userRecord.uid, { user_role: user_role });

    // Create the user document in Firestore with additional fields
    const userDocRef = admin
      .firestore()
      .collection("users")
      .doc(userRecord.uid);
    await userDocRef.set({
      display_name,
      photo_url,
      uid: userRecord.uid,
      phone_number,
      user_role,
      nationality,
      note,
      risk_ratio,
      package,
      address,
      evaluation,
      points,
      balance,
      investment_period,
      yield_period,
      dob: dob ? new Date(dob) : null, // Convert to Date object if it's a valid date string
      payment_status,
      created_time: admin.firestore.FieldValue.serverTimestamp(), // Use server timestamp for creation time
      last_read_notification: last_read_notification
        ? new Date(last_read_notification)
        : null, // Convert to Date object if valid
      // Add other fields as necessary
    });

    // Respond with the user ID of the created user
    return { userId: userRecord.uid };
  } catch (error) {
    console.error("Error creating new user:", error);
    throw new functions.https.HttpsError("unknown", error.message);
  }
});
