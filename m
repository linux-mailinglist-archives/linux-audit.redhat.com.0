Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 522CD3CC00
	for <lists+linux-audit@lfdr.de>; Tue, 11 Jun 2019 14:45:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A80BF30018E0;
	Tue, 11 Jun 2019 12:45:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E22B5DE80;
	Tue, 11 Jun 2019 12:45:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D684F19730;
	Tue, 11 Jun 2019 12:45:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5B6unwi020606 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 11 Jun 2019 02:56:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9FBCF5C231; Tue, 11 Jun 2019 06:56:49 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99BC958899
	for <linux-audit@redhat.com>; Tue, 11 Jun 2019 06:56:47 +0000 (UTC)
Received: from mail-it1-f181.google.com (mail-it1-f181.google.com
	[209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E2B38308FF2C
	for <linux-audit@redhat.com>; Tue, 11 Jun 2019 06:56:35 +0000 (UTC)
Received: by mail-it1-f181.google.com with SMTP id i21so3097550ita.5
	for <linux-audit@redhat.com>; Mon, 10 Jun 2019 23:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=acalvio-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=zBok+e0Snf25hhU4rZkyDG1ma+Zok2x1X2oXUUZ2Pdw=;
	b=zwhOu268bK1neYdiSjJTFk3+Ia1we3AC/iS1cYiUUVP2QN27tvw3mR/x2Jm+EIZKvp
	QHQLePf/WabUutEeYiG1OG3ROUZpvUVkgFRGedchUGrvfUhldtwQClZvUOPZCbLBMmNR
	12Vx419EAyEL1zUvl8cbo4QKAKFxpzpN3/PVgtDeFq9EQDS15bSB1DcB0hgKwPwkEHLe
	EvWHPz5FT7hWTo43k4wmu4q5XgDVQqA6UaSvvY4Kn4zh7YcDjudvIHnqi40wMoQqQ3h4
	Inr/leg4a2x2QgSGc6ijQpWCZzf4IrbC7SCAyWUxCXM8TGs5ss79ikWYboVP38aqXInf
	i3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=zBok+e0Snf25hhU4rZkyDG1ma+Zok2x1X2oXUUZ2Pdw=;
	b=YmGVO4SnNGyAfxkn6MkX1GlGpHV5dXqoTL10cARtD5rhRnH6RRQA4hNiHwMEpnQG8f
	KgEtYSUdxgJJnzF5sozJcQib8/jLoEEnhoouSvSK0s6qrSLED1wNIV/K9Q1o2G8hrEPg
	KCk6SlECLJUh4JyJ8kOpl5t0CEi6WQhWAEC6E5rN3KSbqLhGzsk0nxbcS7EIetqrML3z
	gLdJZvXcTLQEh4myln83vHmLecANA8eqNas827/1bNzcoB5ltxJ/ljWjfveaPIXBoWX5
	noCSEq/LNM490oWCdQLj6LnhplaIdayXgyNKV0qfgAopDLmK+B2H5BvB4TxwiZgUjima
	lKUg==
X-Gm-Message-State: APjAAAX3yQ19sy9TYnrrILDP8rjcg+OpH6MnH3RCYeEWSp/y4Jj/32EL
	iljsY0Ia6ShVXD0RN6pjPTdv/3ty+5a8M56/dKxnFD/DtPI=
X-Google-Smtp-Source: APXvYqzRIpD+4fpl6TzQ3EavyOKtfm2hRmTX0pX7cpVE40/ax/PfEnY163fVTAHBq0ScsXu5cAxTOFZEayzeUe5rW0w=
X-Received: by 2002:a05:660c:3cc:: with SMTP id
	c12mr1897838itl.114.1560236195034; 
	Mon, 10 Jun 2019 23:56:35 -0700 (PDT)
MIME-Version: 1.0
From: Tarun Ramesh <tramesh@acalvio.com>
Date: Tue, 11 Jun 2019 12:26:23 +0530
Message-ID: <CAFQMB-USapCi=pV8ZNkNwTAYZ0FuVKaMKKQvK4y19RUmL90zhA@mail.gmail.com>
Subject: auparse_feed callback on EOE record
To: linux-audit@redhat.com
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 11 Jun 2019 06:56:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Tue, 11 Jun 2019 06:56:36 +0000 (UTC) for IP:'209.85.166.181'
	DOMAIN:'mail-it1-f181.google.com'
	HELO:'mail-it1-f181.google.com' FROM:'tramesh@acalvio.com' RCPT:''
X-RedHat-Spam-Score: -0.008  (DKIM_SIGNED, DKIM_VALID, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.166.181 mail-it1-f181.google.com 209.85.166.181
	mail-it1-f181.google.com <tramesh@acalvio.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 11 Jun 2019 08:33:57 -0400
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7230505054368655463=="
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Tue, 11 Jun 2019 12:45:54 +0000 (UTC)

--===============7230505054368655463==
Content-Type: multipart/alternative; boundary="0000000000002bce91058b06cc69"

--0000000000002bce91058b06cc69
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm using libauparse version 2.8.3. I am trying to experiment with
auparse_feed() with records directly received from audit_get_reply()
instead of from a log file.

My code is as follows:
(I have left out declarations and error handling for brevity)
/*******************************/
    auditfd = audit_open();

    rc = audit_is_enabled(auditfd);
    if (0 == rc)
    {
        rc = audit_set_enabled(auditfd, 1);
    }

    rc = audit_set_pid(auditfd, getpid(), WAIT_YES);

    rule = (struct audit_rule_data *) malloc(sizeof(struct
audit_rule_data));
    memset(rule, 0, sizeof(struct audit_rule_data));

    rc = audit_add_dir(&rule, "/home");

    rc = audit_update_watch_perms(rule, AUDIT_PERM_WRITE | AUDIT_PERM_ATTR);

    rc = audit_delete_rule_data(auditfd, rule, AUDIT_FILTER_EXIT,
AUDIT_ALWAYS);
    rc = audit_add_rule_data(auditfd, rule, AUDIT_FILTER_EXIT,
AUDIT_ALWAYS);

    event_cnt = (int *) malloc(sizeof(int));

    au = auparse_init(AUSOURCE_FEED, NULL);
    auparse_add_callback(au, on_audit_event, event_cnt, free); // callback
function added here
    auparse_set_escape_mode(au, AUPARSE_ESC_RAW);

    pfd[0].fd = auditfd;
    pfd[0].events = POLLIN;

    while (1)
    {
        do
        {
            rc = poll(pfd, 1, 1000); // 1 sec
        }
        while (rc < 0 && EINTR == errno);

        if (pfd[0].revents & POLLIN)
        {
            struct audit_reply reply;

            pfd[0].revents = 0;

            rc = audit_get_reply(auditfd, &reply, GET_REPLY_NONBLOCKING, 0);

            if (rc > 0)
            {
                int rc = 0;
                char type_name[50] = {0};

                printf("type: %d: %s\n", reply.type,
audit_msg_type_to_name(reply.type));
                printf("len: %d\n", reply.len);

                if (NULL != audit_msg_type_to_name(reply.type))
                {
                    strncpy(type_name, audit_msg_type_to_name(reply.type),
49);
                }
                reply.message[reply.len] = '\0';
                printf("message: %s\n", reply.message);

                if (record_buffer_len < (reply.len + 10 +
strlen(type_name)))
                {
                    record_buffer_len = (reply.len + 10 +
strlen(type_name));
                    record_buffer = realloc(record_buffer,
record_buffer_len * sizeof(char));
                }
                memset(record_buffer, 0, record_buffer_len);

                snprintf(record_buffer, (record_buffer_len - 1), "type=%s
%.*s\n", type_name, reply.len, reply.message);

                printf("to auparse: %s\n", record_buffer); // record_buffer
is then passed to auparse_feed()
                printf("=======================================\n\n");

                rc = auparse_feed(au, record_buffer, record_buffer_len);
                if (-1 == rc)
                {
                    perror("auparse_feed ");
                }
            }
        }
    }
    auparse_flush_feed(au);
    auparse_destroy(au);
/*******************************/

The callback function on_audit_event() just goes through the records one by
one and prints the fields and values. I have added a rule to watch for file
edits in the /home folder. I see the records for file creation in this
folder being received, however it looks like the callback function is not
being called when an EOE record is received. Please let me know if I'm
missing something.

Creating a file "test.txt" generates the following output:

type: 1300: SYSCALL
len: 305
message: audit(1560234865.559:6870): arch=c000003e syscall=257 success=yes
exit=3 a0=ffffff9c a1=7fffe4c1529a a2=941 a3=1b6 items=2 ppid=6374
pid=17381 auid=1000 uid=1000 gid=1000 euid=1000 suid=1000 fsuid=1000
egid=1000 sgid=1000 fsgid=1000 tty=pts4 ses=4 comm="touch" exe="/bin/touch"
subj==unconfined key=(null)
*to auparse:* type=SYSCALL audit(1560234865.559:6870): arch=c000003e
syscall=257 success=yes exit=3 a0=ffffff9c a1=7fffe4c1529a a2=941 a3=1b6
items=2 ppid=6374 pid=17381 auid=1000 uid=1000 gid=1000 euid=1000 suid=1000
fsuid=1000 egid=1000 sgid=1000 fsgid=1000 tty=pts4 ses=4 comm="touch"
exe="/bin/touch" subj==unconfined key=(null)

=======================================

type: 1307: CWD
len: 45
message: audit(1560234865.559:6870): cwd="/home/tarun"
*to auparse: *type=CWD audit(1560234865.559:6870): cwd="/home/tarun"

=======================================

type: 1302: PATH
len: 206
message: audit(1560234865.559:6870): item=0 name="/home/tarun"
inode=14286851 dev=103:02 mode=040755 ouid=1000 ogid=1000 rdev=00:00
nametype=PARENT cap_fp=0000000000000000 cap_fi=0000000000000000 cap_fe=0
cap_fver=0
*to auparse: *type=PATH audit(1560234865.559:6870): item=0
name="/home/tarun" inode=14286851 dev=103:02 mode=040755 ouid=1000
ogid=1000 rdev=00:00 nametype=PARENT cap_fp=0000000000000000
cap_fi=0000000000000000 cap_fe=0 cap_fver=0

=======================================

type: 1302: PATH
len: 204
message: audit(1560234865.559:6870): item=1 name="test.txt" inode=14309805
dev=103:02 mode=0100664 ouid=1000 ogid=1000 rdev=00:00 nametype=CREATE
cap_fp=0000000000000000 cap_fi=0000000000000000 cap_fe=0 cap_fver=0
*to auparse:* type=PATH audit(1560234865.559:6870): item=1 name="test.txt"
inode=14309805 dev=103:02 mode=0100664 ouid=1000 ogid=1000 rdev=00:00
nametype=CREATE cap_fp=0000000000000000 cap_fi=0000000000000000 cap_fe=0
cap_fver=0

=======================================

type: 1327: PROCTITLE
len: 66
message: audit(1560234865.559:6870): proctitle=746F75636800746573742E747874
*to auparse:* type=PROCTITLE audit(1560234865.559:6870):
proctitle=746F75636800746573742E747874

=======================================

type: 1320: EOE
len: 28
message: audit(1560234865.559:6870):
*to auparse:* type=EOE audit(1560234865.559:6870):

=======================================

The lines marked "to auparse" is the data I'm sending to auparse_feed().

Please let me know if I need to change the format of the buffer I need to
pass to auparse_feed(), or if I'm missing something else.

Thanks in advance,
Tarun

--0000000000002bce91058b06cc69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I&#39;m using libauparse=
 version 2.8.3. I am trying to experiment with auparse_feed() with records =
directly received from audit_get_reply() instead of from a log file.</div><=
div><br></div><div>My code is as follows:</div><div>(I have left out declar=
ations and error handling for brevity)<br></div><div>/*********************=
**********/</div><div>=C2=A0=C2=A0=C2=A0 auditfd =3D audit_open();<br>=C2=
=A0 <br></div><div>=C2=A0 =C2=A0 rc =3D audit_is_enabled(auditfd);<br>=C2=
=A0 =C2=A0 if (0 =3D=3D rc)<br>=C2=A0 =C2=A0 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 rc =3D audit_set_enabled(auditfd, 1);<br>=C2=A0 =C2=A0 }<br>=C2=A0 =C2=
=A0 <br>=C2=A0 =C2=A0 rc =3D audit_set_pid(auditfd, getpid(), WAIT_YES);<br=
>=C2=A0 =C2=A0 <br>=C2=A0 =C2=A0 rule =3D (struct audit_rule_data *) malloc=
(sizeof(struct audit_rule_data));<br>=C2=A0 =C2=A0 memset(rule, 0, sizeof(s=
truct audit_rule_data));<br><br>=C2=A0 =C2=A0 rc =3D audit_add_dir(&amp;rul=
e, &quot;/home&quot;);<br>=C2=A0=C2=A0 <br>=C2=A0 =C2=A0 rc =3D audit_updat=
e_watch_perms(rule, AUDIT_PERM_WRITE | AUDIT_PERM_ATTR);<br>=C2=A0 =C2=A0 <=
br>=C2=A0 =C2=A0 rc =3D audit_delete_rule_data(auditfd, rule, AUDIT_FILTER_=
EXIT, AUDIT_ALWAYS);<br>=C2=A0 =C2=A0 rc =3D audit_add_rule_data(auditfd, r=
ule, AUDIT_FILTER_EXIT, AUDIT_ALWAYS);<br>=C2=A0=C2=A0 <br>=C2=A0 =C2=A0 ev=
ent_cnt =3D (int *) malloc(sizeof(int));<br>=C2=A0 =C2=A0 <br>=C2=A0 =C2=A0=
 au =3D auparse_init(AUSOURCE_FEED, NULL);<br>=C2=A0 =C2=A0 auparse_add_cal=
lback(au, on_audit_event, event_cnt, free); // callback function added here=
<br>=C2=A0 =C2=A0 auparse_set_escape_mode(au, AUPARSE_ESC_RAW);<br><br>=C2=
=A0 =C2=A0 pfd[0].fd =3D auditfd;<br>=C2=A0 =C2=A0 pfd[0].events =3D POLLIN=
;<br><br>=C2=A0 =C2=A0 while (1)<br>=C2=A0 =C2=A0 {<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 do<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 rc =3D poll(pfd, 1, 1000); // 1 sec<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 }<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 while (rc &lt; 0 &amp;&amp; EINTR =
=3D=3D errno);<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pfd[0].revents &amp; =
POLLIN)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 struct audit_reply reply;<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pfd[0].revents =3D 0;<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 rc =3D audit_get_reply(auditfd, &amp;reply, GET_REPLY_NONBLOCKING, 0=
);</div><div><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rc &gt; 0)<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int rc =3D 0;<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char type_name[50] =3D {0};<br><br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;type: %d: %s\=
n&quot;, reply.type, audit_msg_type_to_name(reply.type));<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;len: %d\n&quot;, rep=
ly.len);<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if =
(NULL !=3D audit_msg_type_to_name(reply.type))<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strncpy(type_name, audit_msg_type_to_name(r=
eply.type), 49);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 }<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reply.message=
[reply.len] =3D &#39;\0&#39;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 printf(&quot;message: %s\n&quot;, reply.message);<br><br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (record_buffer_len =
&lt; (reply.len + 10 + strlen(type_name)))<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 record_buffer_len =3D (reply.len + 10 + strlen(=
type_name));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 record_buffer =3D realloc(record_buffer, record_buffer_len * siz=
eof(char));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(record_buff=
er, 0, record_buffer_len);<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 snprintf(record_buffer, (record_buffer_len - 1), &quot;type=
=3D%s %.*s\n&quot;, type_name, reply.len, reply.message);<br><br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;to auparse: %s\n=
&quot;, record_buffer); // record_buffer is then passed to auparse_feed()<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n\n&quot;);<br><br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D auparse_feed(au, record_bu=
ffer, record_buffer_len);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (-1 =3D=3D rc)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 perror(&quot;auparse_feed &quot;);<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 }<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 }<br>=C2=A0 =C2=
=A0 auparse_flush_feed(au);<br>=C2=A0 =C2=A0 auparse_destroy(au);</div><div=
>/*******************************/</div><div><br></div><div>The callback fu=
nction on_audit_event() just goes through the records one by one and prints=
 the fields and values. I have added a rule to watch for file edits in the =
/home folder. I see the records for file creation in this folder being rece=
ived, however it looks like the callback function is not being called when =
an EOE record is received. Please let me know if I&#39;m missing something.=
</div><div><br></div><div>Creating a file &quot;test.txt&quot; generates th=
e following output:</div><div><br></div><div>type: 1300: SYSCALL<br>len: 30=
5<br>message: audit(1560234865.559:6870): arch=3Dc000003e syscall=3D257 suc=
cess=3Dyes exit=3D3 a0=3Dffffff9c a1=3D7fffe4c1529a a2=3D941 a3=3D1b6 items=
=3D2 ppid=3D6374 pid=3D17381 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 =
suid=3D1000 fsuid=3D1000 egid=3D1000 sgid=3D1000 fsgid=3D1000 tty=3Dpts4 se=
s=3D4 comm=3D&quot;touch&quot; exe=3D&quot;/bin/touch&quot; subj=3D=3Duncon=
fined key=3D(null)<br><b>to auparse:</b> type=3DSYSCALL audit(1560234865.55=
9:6870): arch=3Dc000003e syscall=3D257 success=3Dyes exit=3D3 a0=3Dffffff9c=
 a1=3D7fffe4c1529a a2=3D941 a3=3D1b6 items=3D2 ppid=3D6374 pid=3D17381 auid=
=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=3D1000 egid=3D1=
000 sgid=3D1000 fsgid=3D1000 tty=3Dpts4 ses=3D4 comm=3D&quot;touch&quot; ex=
e=3D&quot;/bin/touch&quot; subj=3D=3Dunconfined key=3D(null)<br><br>=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br><br>type: 1307: CWD<br>len: 45<br>m=
essage: audit(1560234865.559:6870): cwd=3D&quot;/home/tarun&quot;<br><b>to =
auparse: </b>type=3DCWD audit(1560234865.559:6870): cwd=3D&quot;/home/tarun=
&quot;<br><br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br><br>type: 1302=
: PATH<br>len: 206<br>message: audit(1560234865.559:6870): item=3D0 name=3D=
&quot;/home/tarun&quot; inode=3D14286851 dev=3D103:02 mode=3D040755 ouid=3D=
1000 ogid=3D1000 rdev=3D00:00 nametype=3DPARENT cap_fp=3D0000000000000000 c=
ap_fi=3D0000000000000000 cap_fe=3D0 cap_fver=3D0<br><b>to auparse: </b>type=
=3DPATH audit(1560234865.559:6870): item=3D0 name=3D&quot;/home/tarun&quot;=
 inode=3D14286851 dev=3D103:02 mode=3D040755 ouid=3D1000 ogid=3D1000 rdev=
=3D00:00 nametype=3DPARENT cap_fp=3D0000000000000000 cap_fi=3D0000000000000=
000 cap_fe=3D0 cap_fver=3D0<br><br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br><br>type: 1302: PATH<br>len: 204<br>message: audit(1560234865.559:68=
70): item=3D1 name=3D&quot;test.txt&quot; inode=3D14309805 dev=3D103:02 mod=
e=3D0100664 ouid=3D1000 ogid=3D1000 rdev=3D00:00 nametype=3DCREATE cap_fp=
=3D0000000000000000 cap_fi=3D0000000000000000 cap_fe=3D0 cap_fver=3D0<br><b=
>to auparse:</b> type=3DPATH audit(1560234865.559:6870): item=3D1 name=3D&q=
uot;test.txt&quot; inode=3D14309805 dev=3D103:02 mode=3D0100664 ouid=3D1000=
 ogid=3D1000 rdev=3D00:00 nametype=3DCREATE cap_fp=3D0000000000000000 cap_f=
i=3D0000000000000000 cap_fe=3D0 cap_fver=3D0<br><br>=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<br><br>type: 1327: PROCTITLE<br>len: 66<br>message: a=
udit(1560234865.559:6870): proctitle=3D746F75636800746573742E747874<br><b>t=
o auparse:</b> type=3DPROCTITLE audit(1560234865.559:6870): proctitle=3D746=
F75636800746573742E747874</div><div><br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D<br><br>type: 1320: EOE<br>len: 28<br>message: audit(1560234865.55=
9:6870): <br><b>to auparse:</b> type=3DEOE audit(1560234865.559:6870): <br>=
<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div><div><br></div><div>T=
he lines marked &quot;to auparse&quot; is the data I&#39;m sending to aupar=
se_feed().</div><div><br></div><div>Please let me know if I need to change =
the format of the buffer I need to pass to auparse_feed(), or if I&#39;m mi=
ssing something else.</div><div><br></div><div>Thanks in advance,</div><div=
>Tarun<br></div></div>

--0000000000002bce91058b06cc69--


--===============7230505054368655463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============7230505054368655463==--

