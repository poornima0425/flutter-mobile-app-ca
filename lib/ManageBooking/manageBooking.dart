import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Managebooking extends StatefulWidget {
  const Managebooking({super.key});

  @override
  State<Managebooking> createState() => _ManagebookingState();
}

class _ManagebookingState extends State<Managebooking> {
  final nameController = TextEditingController();
  final destinationController = TextEditingController();
  final dateController = TextEditingController();

  // READ all bookings
  Future<List<dynamic>> fetchBookings() async {
    final response = await Supabase.instance.client
        .from('bookings')
        .select()
        .order('id', ascending: false);
    return response;
  }

  // CREATE new booking
  Future<void> addBooking() async {
    if (nameController.text.isEmpty ||
        destinationController.text.isEmpty ||
        dateController.text.isEmpty) return;

    await Supabase.instance.client.from('bookings').insert({
      'name': nameController.text,
      'destination': destinationController.text,
      'date': dateController.text,
    });

    nameController.clear();
    destinationController.clear();
    dateController.clear();

    setState(() {}); // reload list
  }

  // UPDATE booking
  Future<void> updateBooking(int id, String newDest) async {
    await Supabase.instance.client
        .from('bookings')
        .update({'destination': newDest}).eq('id', id);

    setState(() {}); // refresh
  }

  // DELETE booking
  Future<void> deleteBooking(int id) async {
    await Supabase.instance.client.from('bookings').delete().eq('id', id);
    setState(() {}); // refresh UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F5F9),

      appBar: AppBar(
        title: const Text("Manage Bookings",
        style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [

            // INPUT FIELDS CARD
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // NAME
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "Traveler Name",
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // DESTINATION
                    TextField(
                      controller: destinationController,
                      decoration: InputDecoration(
                        labelText: "Destination",
                        prefixIcon: const Icon(Icons.location_on),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // DATE
                    TextField(
                      controller: dateController,
                      decoration: InputDecoration(
                        labelText: "Travel Date",
                        prefixIcon: const Icon(Icons.calendar_today),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // ADD BUTTON
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: addBooking,
                        child: const Text(
                          "Add Booking",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // BOOKINGS LIST
            Expanded(
              child: FutureBuilder(
                future: fetchBookings(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final data = snapshot.data as List;
                  if (data.isEmpty) {
                    return const Center(
                      child: Text(
                        "No bookings found",
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final item = data[index];

                      return Card(
                        color: Colors.white,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: const Icon(Icons.flight, color: Colors.white),
                          ),

                          title: Text(
                            item['name'],
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),

                          subtitle: Text(
                            "To: ${item['destination']}\nDate: ${item['date']}",
                          ),

                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // UPDATE BUTTON
                              IconButton(
                                icon: const Icon(Icons.edit, color: Colors.blue),
                                onPressed: () {
                                  TextEditingController editController =
                                      TextEditingController(
                                          text: item['destination']);

                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      title: const Text("Edit Destination"),
                                      content: TextField(
                                        controller: editController,
                                        decoration: const InputDecoration(
                                            hintText: "New destination"),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            updateBooking(
                                              item['id'],
                                              editController.text,
                                            );
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Save"),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),

                              // DELETE BUTTON
                              IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  deleteBooking(item['id']);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
