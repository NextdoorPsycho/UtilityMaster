import 'package:fast_log/fast_log.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:utility_master/pages/router.dart';

class SettingsPage extends StatelessWidget {
  static void open(BuildContext context) => context.go("/settings");

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SettingsMeat();
  }
}

class _SettingsMeat extends StatefulWidget {
  const _SettingsMeat();

  @override
  State<_SettingsMeat> createState() => _SettingsMeatState();
}

class _SettingsMeatState extends State<_SettingsMeat> {
  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ShadAlert(
          iconSrc: LucideIcons.terminal,
          title: Text('Heads up!'),
          description:
              Text('You can add components to your app using the cli.'),
        ),
        const ShadAlert.destructive(
          iconSrc: LucideIcons.circleAlert,
          title: Text('Error'),
          description: Text('Your session has expired. Please log in again.'),
        ),
        ShadAccordion<({String content, String title})>.multiple(
          // you dont need multiple if you only want one open at a time
          children: _details.map(
            (detail) => ShadAccordionItem(
              value: detail,
              title: Text(detail.title),
              content: Text(detail.content),
            ),
          ),
        ),
        const ShadAvatar(
          'https://avatars.githubusercontent.com/u/29320316?v=4',
          placeholder: Text('CN'),
        ),
        const Row(
          children: [
            ShadBadge(
              text: Text('Primary'),
            ),
            ShadBadge.secondary(
              text: Text('Secondary'),
            ),
            ShadBadge.destructive(
              text: Text('Destructive'),
            ),
            ShadBadge.outline(
              text: Text('Outline'),
            )
          ],
        ),
        Row(
          children: [
            ShadButton(
              onPressed: () {},
              gradient: const LinearGradient(colors: [
                Colors.cyan,
                Colors.indigo,
              ]),
              shadows: [
                BoxShadow(
                  color: Colors.blue.withOpacity(.4),
                  spreadRadius: 4,
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
              text: const Text('Gradient with Shadow'),
            ),
            ShadButton(
              text: const Text('Primary'),
              onPressed: () {},
            ),
            ShadButton.destructive(
              text: const Text('Destructive'),
              onPressed: () {},
            ),
            ShadButton.outline(
              text: const Text('Outline'),
              onPressed: () {},
            ),
            ShadButton.ghost(
              text: const Text('Ghost'),
              onPressed: () {},
            ),
            ShadButton.link(
              text: const Text('Link'),
              onPressed: () {},
            ),
            ShadButton.outline(
              icon: const Icon(
                Icons.chevron_right,
                size: 16,
              ),
              size: ShadButtonSize.icon,
              onPressed: () {},
            ),
            ShadButton(
              onPressed: () {},
              text: const Text('Login with Email'),
              icon: const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.mail_outlined,
                  size: 16,
                ),
              ),
            ),
            ShadButton(
              onPressed: () {},
              text: const Text('Please wait'),
              icon: const Padding(
                padding: EdgeInsets.only(right: 8),
                child: SizedBox.square(
                  dimension: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
        ShadCard(
          width: 350,
          title: Text('Create project', style: theme.textTheme.h4),
          description: const Text('Deploy your new project in one-click.'),
          content: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Name'),
                const ShadInput(),
                const SizedBox(height: 6),
                const Text('Framework'),
                ShadSelect<String>(
                  placeholder: const Text('Select'),
                  options: _frameworks.entries
                      .map(
                          (e) => ShadOption(value: e.key, child: Text(e.value)))
                      .toList(),
                  selectedOptionBuilder: (context, value) {
                    return Text(_frameworks[value]!);
                  },
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
          footer: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShadButton.outline(
                text: const Text('Cancel'),
                onPressed: () {},
              ),
              ShadButton(
                text: const Text('Deploy'),
                onPressed: () {},
              ),
            ],
          ),
        ),
        const CardNotifications(),
        ShadCheckbox(
          value: _value,
          onChanged: (v) => setState(() => _value = v),
          label: const Text('Accept terms and conditions'),
          sublabel: const Text(
            'You agree to our Terms of Service and Privacy Policy.',
          ),
        ),
        ShadCheckboxFormField(
          id: 'terms',
          initialValue: false,
          inputLabel: const Text('I accept the terms and conditions'),
          onChanged: (v) {},
          inputSublabel: const Text('You agree to our Terms and Conditions'),
          validator: (v) {
            if (!v) {
              return 'You must accept the terms and conditions';
            }
            return null;
          },
        ),
        ShadButton.outline(
          text: const Text('Edit Profile'),
          onPressed: () {
            showShadDialog(
              context: context,
              builder: (context) => ShadDialog(
                title: const Text('Edit Profile'),
                description: const Text(
                    "Make changes to your profile here. Click save when you're done"),
                content: Container(
                  width: 375,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: profile
                        .map(
                          (p) => Row(
                            children: [
                              Expanded(
                                child: Text(
                                  p.title,
                                  textAlign: TextAlign.end,
                                  style: theme.textTheme.small,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                flex: 3,
                                child: ShadInput(initialValue: p.value),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
                actions: const [ShadButton(text: Text('Save changes'))],
              ),
            );
          },
        ),
        ShadButton.outline(
          text: const Text('Show Dialog'),
          onPressed: () {
            showShadDialog(
              context: context,
              builder: (context) => ShadDialog.alert(
                title: const Text('Are you absolutely sure?'),
                description: const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'This action cannot be undone. This will permanently delete your account and remove your data from our servers.',
                  ),
                ),
                actions: [
                  ShadButton.outline(
                    text: const Text('Cancel'),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                  ShadButton(
                    text: const Text('Continue'),
                    onPressed: () => Navigator.of(context).pop(true),
                  ),
                ],
              ),
            );
          },
        ),
        // const FormPage(),
        // const ShadImage(
        //   'assets/icon.png',
        //   height: 100,
        //   fit: BoxFit.fitHeight,
        // ),
        // const ShadImage.square(
        //   'https://avatars.githubusercontent.com/u/124599?v=4',
        //   size: 50,
        // ),
        // const ShadImage.square(
        //   'assets/flutter.svg',
        //   size: 50,
        // ),
        // const ShadImage.square(
        //   // Rive images
        //   'assets/off_road_car.riv',
        //   size: 200,
        // ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 320),
          child: const ShadInput(
            placeholder: Text('Enter your email'),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        PasswordInput(),
        ShadInputFormField(
          id: 'username',
          label: const Text('Username'),
          placeholder: const Text('Enter your username'),
          description: const Text('This is your public display name.'),
          validator: (v) {
            if (v.length < 2) {
              return 'Username must be at least 2 characters.';
            }
            return null;
          },
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width * 0.6,
          ),
          child: const ShadProgress(value: 0.5),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width * 0.6,
          ),
          child: const ShadProgress(),
        ),
        ShadRadioGroup<String>(
          items: [
            ShadRadio(
              label: Text('Default'),
              value: 'default',
            ),
            ShadRadio(
              label: Text('Comfortable'),
              value: 'comfortable',
            ),
            ShadRadio(
              label: Text('Nothing'),
              value: 'nothing',
            ),
          ],
        ),
        ShadRadioGroupFormField<NotifyAbout>(
          label: const Text('Notify me about'),
          items: NotifyAbout.values.map(
            (e) => ShadRadio(
              value: e,
              label: Text(e.message),
            ),
          ),
          validator: (v) {
            if (v == null) {
              return 'You need to select a notification type.';
            }
            return null;
          },
        ),
        ShadSelect<String>(
          placeholder: const Text('Select a fruit'),
          options: [
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 6, 6, 6),
              child: Text(
                'Fruits',
                style: theme.textTheme.muted.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.popoverForeground,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            ...fruits.entries
                .map((e) => ShadOption(value: e.key, child: Text(e.value)))
                .toList(),
          ],
          selectedOptionBuilder: (context, value) => Text(fruits[value]!),
        ),
        ShadSelect<String>(
          placeholder: const Text('Select a timezone'),
          options: getTimezonesWidgets(theme),
          selectedOptionBuilder: (context, value) {
            final timezone = timezones.entries
                .firstWhere((element) => element.value.containsKey(value))
                .value[value];
            return Text(timezone!);
          },
        ),
        ShadSelectFormField<String>(
          id: 'email',
          minWidth: 350,
          initialValue: null,
          onChanged: (v) {},
          options: verifiedEmails
              .map((email) => ShadOption(value: email, child: Text(email)))
              .toList(),
          selectedOptionBuilder: (context, value) => value == 'none'
              ? const Text('Select a verified email to display')
              : Text(value),
          placeholder: const Text('Select a verified email to display'),
          validator: (v) {
            if (v == null) {
              return 'Please select an email to display';
            }
            return null;
          },
        ),
        ShadButton.outline(
          text: const Text('Open'),
          onPressed: () => showShadSheet(
            side: ShadSheetSide.right,
            context: context,
            builder: (context) => const Placeholder(),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ShadButton.outline(
                  width: 100,
                  text: const Text('Top'),
                  onPressed: () => showShadSheet(
                    side: ShadSheetSide.top,
                    context: context,
                    builder: (context) =>
                        const EditProfileSheet(side: ShadSheetSide.top),
                  ),
                ),
                ShadButton.outline(
                  width: 100,
                  text: const Text('Bottom'),
                  onPressed: () => showShadSheet(
                    side: ShadSheetSide.bottom,
                    context: context,
                    builder: (context) =>
                        const EditProfileSheet(side: ShadSheetSide.bottom),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ShadButton.outline(
                  width: 100,
                  text: const Text('Right'),
                  onPressed: () => showShadSheet(
                    side: ShadSheetSide.right,
                    context: context,
                    builder: (context) =>
                        const EditProfileSheet(side: ShadSheetSide.right),
                  ),
                ),
                ShadButton.outline(
                  width: 100,
                  text: const Text('Left'),
                  onPressed: () => showShadSheet(
                    side: ShadSheetSide.left,
                    context: context,
                    builder: (context) =>
                        const EditProfileSheet(side: ShadSheetSide.left),
                  ),
                ),
              ],
            ),
            ShadSlider(
              initialValue: 33,
              max: 100,
            ),
            ShadSwitch(
              value: value,
              onChanged: (v) => setState(() => value = v),
              label: const Text('Airplane Mode'),
            ),
            ShadSwitchFormField(
              id: 'terms',
              initialValue: false,
              inputLabel: const Text('I accept the terms and conditions'),
              onChanged: (v) {},
              inputSublabel:
                  const Text('You agree to our Terms and Conditions'),
              validator: (v) {
                if (!v) {
                  return 'You must accept the terms and conditions';
                }
                return null;
              },
            ),
            // TablePage(),
            ShadButton.outline(
              text: const Text('Add to calendar'),
              onPressed: () {
                ShadToaster.of(context).show(
                  ShadToast(
                    title: const Text('Scheduled: Catch up'),
                    description:
                        const Text('Friday, February 10, 2023 at 5:57 PM'),
                    action: ShadButton.outline(
                      text: const Text('Undo'),
                      onPressed: () => ShadToaster.of(context).hide(),
                    ),
                  ),
                );
              },
            ),
            ShadButton.outline(
              text: const Text('Show Toast'),
              onPressed: () {
                ShadToaster.of(context).show(
                  const ShadToast(
                    description: Text('Your message has been sent.'),
                  ),
                );
              },
            ),
            ShadButton.outline(
              text: const Text('Show Toast'),
              onPressed: () {
                ShadToaster.of(context).show(
                  const ShadToast(
                    title: Text('Uh oh! Something went wrong'),
                    description: Text('There was a problem with your request'),
                  ),
                );
              },
            ),
            ShadButton.outline(
              text: const Text('Show Toast'),
              onPressed: () {
                ShadToaster.of(context).show(
                  ShadToast(
                    title: const Text('Uh oh! Something went wrong'),
                    description:
                        const Text('There was a problem with your request'),
                    action: ShadButton.outline(
                      text: const Text('Try again'),
                      onPressed: () => ShadToaster.of(context).hide(),
                    ),
                  ),
                );
              },
            ),
            ShadButton.outline(
              text: const Text('Show Toast'),
              onPressed: () {
                ShadToaster.of(context).show(
                  ShadToast.destructive(
                    title: const Text('Uh oh! Something went wrong'),
                    description:
                        const Text('There was a problem with your request'),
                    action: ShadButton.destructive(
                      text: const Text('Try again'),
                      border: Border.all(
                        color: theme.colorScheme.destructiveForeground,
                      ),
                      onPressed: () => ShadToaster.of(context).hide(),
                    ),
                  ),
                );
              },
            ),
            ShadTooltip(
              builder: (context) => const Text('Add to library'),
              child: ShadButton.outline(
                text: const Text('Hover/Focus'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    ));
  }
}

const invoices = [
  (
    invoice: "INV001",
    paymentStatus: "Paid",
    totalAmount: r"$250.00",
    paymentMethod: "Credit Card",
  ),
  (
    invoice: "INV002",
    paymentStatus: "Pending",
    totalAmount: r"$150.00",
    paymentMethod: "PayPal",
  ),
  (
    invoice: "INV003",
    paymentStatus: "Unpaid",
    totalAmount: r"$350.00",
    paymentMethod: "Bank Transfer",
  ),
  (
    invoice: "INV004",
    paymentStatus: "Paid",
    totalAmount: r"$450.00",
    paymentMethod: "Credit Card",
  ),
  (
    invoice: "INV005",
    paymentStatus: "Paid",
    totalAmount: r"$550.00",
    paymentMethod: "PayPal",
  ),
  (
    invoice: "INV006",
    paymentStatus: "Pending",
    totalAmount: r"$200.00",
    paymentMethod: "Bank Transfer",
  ),
  (
    invoice: "INV007",
    paymentStatus: "Unpaid",
    totalAmount: r"$300.00",
    paymentMethod: "Credit Card",
  ),
];

bool value = false;

final verifiedEmails = [
  'm@example.com',
  'm@google.com',
  'm@support.com',
];

final timezones = {
  'North America': {
    'est': 'Eastern Standard Time (EST)',
    'cst': 'Central Standard Time (CST)',
    'mst': 'Mountain Standard Time (MST)',
    'pst': 'Pacific Standard Time (PST)',
    'akst': 'Alaska Standard Time (AKST)',
    'hst': 'Hawaii Standard Time (HST)',
  },
  'Europe & Africa': {
    'gmt': 'Greenwich Mean Time (GMT)',
    'cet': 'Central European Time (CET)',
    'eet': 'Eastern European Time (EET)',
    'west': 'Western European Summer Time (WEST)',
    'cat': 'Central Africa Time (CAT)',
    'eat': 'Eastern Africa Time (EAT)',
  },
  'Asia': {
    'msk': 'Moscow Time (MSK)',
    'ist': 'India Standard Time (IST)',
    'cst_china': 'China Standard Time (CST)',
    'jst': 'Japan Standard Time (JST)',
    'kst': 'Korea Standard Time (KST)',
    'ist_indonasia': 'Indonesia Standard Time (IST)',
  },
  'Australia & Pacific': {
    'awst': 'Australian Western Standard Time (AWST)',
    'acst': 'Australian Central Standard Time (ACST)',
    'aest': 'Australian Eastern Standard Time (AEST)',
    'nzst': 'New Zealand Standard Time (NZST)',
    'fjt': 'Fiji Time (FJT)',
  },
  'South America': {
    'art': 'Argentina Time (ART)',
    'bot': 'Bolivia Time (BOT)',
    'brt': 'Brasilia Time (BRT)',
    'clt': 'Chile Standard Time (CLT)',
  },
};

List<Widget> getTimezonesWidgets(ShadThemeData theme) {
  final widgets = <Widget>[];
  for (final zone in timezones.entries) {
    widgets.add(
      Padding(
        padding: const EdgeInsets.fromLTRB(32, 6, 6, 6),
        child: Text(
          zone.key,
          style: theme.textTheme.muted.copyWith(
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.popoverForeground,
          ),
          textAlign: TextAlign.start,
        ),
      ),
    );
    widgets.addAll(zone.value.entries
        .map((e) => ShadOption(value: e.key, child: Text(e.value))));
  }
  return widgets;
}

final fruits = {
  'apple': 'Apple',
  'banana': 'Banana',
  'blueberry': 'Blueberry',
  'grapes': 'Grapes',
  'pineapple': 'Pineapple',
};

enum NotifyAbout {
  all,
  mentions,
  nothing;

  String get message {
    return switch (this) {
      all => 'All new messages',
      mentions => 'Direct messages and mentions',
      nothing => 'Nothing',
    };
  }
}

bool _value = false;

final _details = [
  (
    title: 'Is it acceptable?',
    content: 'Yes. It adheres to the WAI-ARIA design pattern.',
  ),
  (
    title: 'Is it styled?',
    content:
        "Yes. It comes with default styles that matches the other components' aesthetic.",
  ),
  (
    title: 'Is it animated?',
    content:
        "Yes. It's animated by default, but you can disable it if you prefer.",
  ),
];

const _frameworks = {
  'next': 'Next.js',
  'react': 'React',
  'astro': 'Astro',
  'nuxt': 'Nuxt.js',
};

const _notifications = [
  (
    title: "Your call has been confirmed.",
    description: "1 hour ago",
  ),
  (
    title: "You have a new message!",
    description: "1 hour ago",
  ),
  (
    title: "Your subscription is expiring soon!",
    description: "2 hours ago",
  ),
];

final profile = [
  (title: 'Name', value: 'Alexandru'),
  (title: 'Username', value: 'nank1ro'),
];

class CardNotifications extends StatefulWidget {
  const CardNotifications({super.key});

  @override
  State<CardNotifications> createState() => _CardNotificationsState();
}

class _CardNotificationsState extends State<CardNotifications> {
  final pushNotifications = ValueNotifier(false);

  @override
  void dispose() {
    pushNotifications.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ShadCard(
      width: 380,
      title: const Text('Notifications'),
      description: const Text('You have 3 unread messages.'),
      content: Column(
        children: [
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: theme.radius,
              border: Border.all(color: theme.colorScheme.border),
            ),
            child: Row(
              children: [
                ShadImage.square(
                  LucideIcons.bellRing,
                  size: 24,
                  color: theme.colorScheme.foreground,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Push Notifications',
                          style: theme.textTheme.small,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Send notifications to device.',
                          style: theme.textTheme.muted,
                        )
                      ],
                    ),
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: pushNotifications,
                  builder: (context, value, child) {
                    return ShadSwitch(
                      value: value,
                      onChanged: (v) => pushNotifications.value = v,
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ..._notifications.map(
            (n) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.only(top: 4),
                  decoration: const BoxDecoration(
                    color: Color(0xFF0CA5E9),
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Your call has been confirmed.',
                            style: theme.textTheme.small),
                        const SizedBox(height: 4),
                        Text(n.description, style: theme.textTheme.muted),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
      footer: ShadButton(
        width: double.infinity,
        text: const Text('Mark all as read'),
        icon: const Padding(
          padding: EdgeInsets.only(right: 8),
          child: ShadImage.square(LucideIcons.check, size: 16),
        ),
        onPressed: () {},
      ),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({
    super.key,
  });

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final formKey = GlobalKey<ShadFormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ShadForm(
          key: formKey,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ShadInputFormField(
                  id: 'username',
                  label: const Text('Username'),
                  placeholder: const Text('Enter your username'),
                  description: const Text('This is your public display name.'),
                  validator: (v) {
                    if (v.length < 2) {
                      return 'Username must be at least 2 characters.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ShadButton(
                  text: const Text('Submit'),
                  onPressed: () {
                    if (formKey.currentState!.saveAndValidate()) {
                      info(
                          'validation succeeded with ${formKey.currentState!.value}');
                    } else {
                      info('validation failed');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return ShadInput(
      placeholder: const Text('Password'),
      obscureText: obscure,
      prefix: const Padding(
        padding: EdgeInsets.all(4.0),
        child: ShadImage.square(size: 16, LucideIcons.lock),
      ),
      suffix: ShadButton(
        width: 24,
        height: 24,
        padding: EdgeInsets.zero,
        decoration: ShadDecoration.none,
        icon: ShadImage.square(
          size: 16,
          obscure ? LucideIcons.eyeOff : LucideIcons.eye,
        ),
        onPressed: () {
          setState(() => obscure = !obscure);
        },
      ),
    );
  }
}

class PopoverPage extends StatefulWidget {
  const PopoverPage({super.key});

  @override
  State<PopoverPage> createState() => _PopoverPageState();
}

class _PopoverPageState extends State<PopoverPage> {
  final popoverController = ShadPopoverController();

  final List<({String name, String initialValue})> layer = [
    (name: 'Width', initialValue: '100%'),
    (name: 'Max. width', initialValue: '300px'),
    (name: 'Height', initialValue: '25px'),
    (name: 'Max. height', initialValue: 'none'),
  ];

  @override
  void dispose() {
    popoverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = ShadTheme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: ShadPopover(
          controller: popoverController,
          popover: (context) => SizedBox(
            width: 288,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Dimensions',
                  style: textTheme.h4,
                ),
                Text(
                  'Set the dimensions for the layer.',
                  style: textTheme.p,
                ),
                const SizedBox(height: 4),
                ...layer.map((e) => Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Text(
                          e.name,
                          textAlign: TextAlign.start,
                        )),
                        Expanded(
                          flex: 2,
                          child: ShadInput(
                            initialValue: e.initialValue,
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
          child: ShadButton.outline(
            text: const Text('Open popover'),
            onPressed: popoverController.toggle,
          ),
        ),
      ),
    );
  }
}

class EditProfileSheet extends StatelessWidget {
  const EditProfileSheet({super.key, required this.side});

  final ShadSheetSide side;

  BoxConstraints get constraints {
    return switch (side) {
      ShadSheetSide.top || ShadSheetSide.bottom => BoxConstraints.tightFor(
          width: MediaQuery.sizeOf(
                  router.routerDelegate.navigatorKey.currentContext!)
              .width),
      ShadSheetSide.left || ShadSheetSide.right => BoxConstraints.tightFor(
          height: MediaQuery.sizeOf(
                  router.routerDelegate.navigatorKey.currentContext!)
              .height,
          width: 512,
        ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ShadSheet(
      constraints: constraints,
      title: const Text('Edit Profile'),
      description: const Text(
          "Make changes to your profile here. Click save when you're done"),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: profile
              .map(
                (p) => Row(
                  children: [
                    Expanded(
                      child: Text(
                        p.title,
                        textAlign: TextAlign.end,
                        style: theme.textTheme.small,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 5,
                      child: ShadInput(initialValue: p.value),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
      actions: const [
        ShadButton(text: Text('Save changes')),
      ],
    );
  }
}

class TablePage extends StatelessWidget {
  const TablePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 600,
            // added just to center the table vertically
            maxHeight: 450,
          ),
          child: ShadTable.list(
            header: const [
              ShadTableCell.header(child: Text('Invoice')),
              ShadTableCell.header(child: Text('Status')),
              ShadTableCell.header(child: Text('Method')),
              ShadTableCell.header(
                alignment: Alignment.centerRight,
                child: Text('Amount'),
              ),
            ],
            footer: const [
              ShadTableCell.footer(child: Text('Total')),
              ShadTableCell.footer(child: Text('')),
              ShadTableCell.footer(child: Text('')),
              ShadTableCell.footer(
                alignment: Alignment.centerRight,
                child: Text(r'$2500.00'),
              ),
            ],
            columnSpanExtent: (index) {
              if (index == 2) return const FixedTableSpanExtent(130);
              if (index == 3) {
                return const MaxTableSpanExtent(
                  FixedTableSpanExtent(120),
                  RemainingTableSpanExtent(),
                );
              }
              // uses the default value
              return null;
            },
            children: invoices.map(
              (invoice) => [
                ShadTableCell(
                  child: Text(
                    invoice.invoice,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ShadTableCell(child: Text(invoice.paymentStatus)),
                ShadTableCell(child: Text(invoice.paymentMethod)),
                ShadTableCell(
                  alignment: Alignment.centerRight,
                  child: Text(
                    invoice.totalAmount,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
