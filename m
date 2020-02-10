Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A8318158623
	for <lists+linux-audit@lfdr.de>; Tue, 11 Feb 2020 00:29:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581377389;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post:autocrypt:autocrypt;
	bh=1kUGwOhTBMNphBcc0d1WKxYvQ2RVLnbQoQXhQzGRD4w=;
	b=fwfdUVNmIblvkX9RkjqJ4xBYqnQQpHE5Ysllght53VW0WgFWWFbQU/kMTJrcGK6kH1X7lf
	K9eazCcSX7X0eccSMVUJJxRx8h6s5wOsoIew09xQHkzVElt+Z4m+d2wrhAr094VxkVRNQ4
	abypRjhsaNRqdZxpRShY/mgrWtjvfBs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-S49cjuY4Omq_7RQSanA0Dg-1; Mon, 10 Feb 2020 18:29:46 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2BAB8017CC;
	Mon, 10 Feb 2020 23:29:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5986C5DA2C;
	Mon, 10 Feb 2020 23:29:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 611E918089CD;
	Mon, 10 Feb 2020 23:29:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01ANTVAD015937 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 10 Feb 2020 18:29:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EE35BC68E5; Mon, 10 Feb 2020 23:29:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9EE5C68FD
	for <linux-audit@redhat.com>; Mon, 10 Feb 2020 23:29:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADC0D900828
	for <linux-audit@redhat.com>; Mon, 10 Feb 2020 23:29:28 +0000 (UTC)
X-YMail-OSG: 0COZJhMVM1lMlIhEYiR5_alhRjj17_VfDuK74R0Ggkwu4WPVMzQYg3Xte2UFOAP
	xE4GKMj.0mS.2F4TdUIMGoNk6ntr3eQ0sX0nKgr2teNcHd0WtEqLdf3qQgAoc89yLXXS984vgjXj
	hwdwWREwPRdM.BllT0VnIfV11zm6ALB1sQyyCVL4ztQH7oLuFeDEI3.l35H._aTUhKQps8X5M8M9
	V1XHFNNYLxMmtJqVQ3bcE8ee68fwtlZJc4jDJJGXVhKWLl97m6x2Gkc.9Mt79p5JQSNMN.CwNpBR
	1ZvOaLtki.wGjdPsi8igRHZOj4xlt4_hY9altwIvIlw_qcE2a7WOwd1e0yEW5GfqP4InxeUTzX1Q
	PQHdjHyATe9LvnbxvBOUDNPd8Xaorap3oBS0zDj3jjJFQNGC.n24x5AZDQcJ9st4UPwZoYeRpYPF
	x9KzUKOGLho5lZE0hbMCFh8IwHezfPuQR5khKQuUTFoeaiUANDsjyf26yWloQPu5UtB0PhR9seLw
	OSuJf68LMzlouPu9aMhAerH8hmg_LOps2jmhntcQ_CdxtYMawL1hNgkBLrNrxHMXpjvx18yh7YsQ
	lY6zhL1DlZ3KlU.QSzyMLBoyvtU9mCnM_7.Zj8ashl_.sVjT6OOO6PJlr52pWWi6NkiBnoJiPyLS
	jBf6eLesC_pTKTeGXNuZvht3QnlorPIRACS3lZHI4QzRejUVGff13zW3_3teCjc4SmFR1UtOZkci
	XDVwbxhchjehnHgDYq2bI37EkEY_8fiO_0E63GA7d451Ssd93MZ50qnTUN.WJMmT3lEfZIkoTzl0
	8sfJYB8e1aB6GZFqFiXFi6qzmF5PSah8oU2vitvUuRiSfxt5NhpZCihk1JoXcHengGC4d2APfZB8
	9kE5XPT5MI3_HBwv4qhyoMs3QTHkr8I5qOkfiQflejdvyx1Ae.sDpiUIcR07UFHItqQP6i_Aep1C
	xrJPQJ8EjSYO.W6xAeYpX5YLKHeNqlujCsIzkvnL.eV0SFmk5xsrrR5RRd_Mr3pB1F5cjTN_AhSW
	aGdyI8nElPF6K6Az2pN8ih.odjWw.jM6sIeoJmeZMPyNGXjhNnouUstcY45WhL3MZqywhPIr_gZz
	vpmDIFxkJf5XYSlVVHj4tZ5PNkqWtRtG8WZCCDtph.Af25r3QZVv4gAC4nMfU72mUK0zdmhyds8c
	wazomV1TrowFjCU.Y2DKqKfYU8iLc5rtm7na1S4GJZGBzDTBWAmirolyWk.UEVQJ8H6XI2UgIgl3
	NFuuUDyARuLI8fHG5mX2T70S8KcFsLziI0miZ65bYe9E17SjS1SAtOq2WVuIfOl1_aDvGoe4sXSH
	ywwvjrG7kYEUfEx6JvMRVnhygcXUTewiIILcv9dvawBcvE3Hw9t7fO.TjXXE0d4wwcYQTgSvDzGZ
	_3vrMXmtpdGjuqNRe5O1A
Received: from sonic304-28.consmr.mail.ne1.yahoo.com
	(sonic304-28.consmr.mail.ne1.yahoo.com [66.163.191.154]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-47-4PaNOeDpOfGAbXbIh3XzdA-1;
	Mon, 10 Feb 2020 18:29:26 -0500
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic304.consmr.mail.ne1.yahoo.com with HTTP;
	Mon, 10 Feb 2020 23:29:25 +0000
Received: by smtp422.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 5cd6f8cbe8f94a335779083dd96cb0b5; 
	Mon, 10 Feb 2020 23:29:23 +0000 (UTC)
Subject: Re: Is auditing ftruncate useful?
To: Orion Poplawski <orion@nwra.com>, Paul Moore <paul@paul-moore.com>,
	Steve Grubb <sgrubb@redhat.com>, linux-audit@redhat.com
References: <5599a207-7054-af2e-6d10-0421154168b8@nwra.com>
	<8010cdd2-468b-ac87-54f1-2846baf28d28@nwra.com>
	<57c2b1a1-5406-4d77-9dc5-ad6c99b987a8@magitekltd.com>
	<1758232.KkKbY19U6n@x2>
	<17021a5a608.27df.85c95baa4474aabc7814e68940a78392@paul-moore.com>
	<CAHC9VhRhCQook8wPcYTb6Xfr0v+fqszzHxuVGzZxmK5N1KPzcw@mail.gmail.com>
	<4b16e97a-49d7-d558-0d87-7cdff23888b5@nwra.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	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
	abzjfg==
Message-ID: <bfd41bc4-7251-ef19-4ab8-6336f5eaf3f1@schaufler-ca.com>
Date: Mon, 10 Feb 2020 15:29:22 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <4b16e97a-49d7-d558-0d87-7cdff23888b5@nwra.com>
Content-Language: en-US
X-MC-Unique: 4PaNOeDpOfGAbXbIh3XzdA-1
X-MC-Unique: S49cjuY4Omq_7RQSanA0Dg-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01ANTVAD015937
X-loop: linux-audit@redhat.com
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2/10/2020 3:05 PM, Orion Poplawski wrote:
> On 2/10/20 3:54 PM, Paul Moore wrote:
>> On Fri, Feb 7, 2020 at 4:56 PM Paul Moore <paul@paul-moore.com> wrote:
>>> On February 7, 2020 2:18:33 PM Steve Grubb <sgrubb@redhat.com> wrote:
>>>> On Thursday, February 6, 2020 1:33:19 PM EST Lenny Bruzenak wrote:
>>>>>> Doesn't seem much better:
>>>>>>
>>>>>> type=PROCTITLE msg=audit(02/06/2020 10:58:23.626:119631) :
>>>>>> proctitle=/bin/bash /usr/bin/thunderbird
>>>>>> type=SYSCALL msg=audit(02/06/2020 10:58:23.626:119631) : arch=x86_64
>>>>>> syscall=ftruncate success=yes exit=0 a0=0x4a a1=0x28 a2=0x7f1e41600018
>>>>>> a3=0xfffffe00 items=0 ppid=2451 pid=3561 auid=USER uid=USER gid=USER
>>>>>> euid=USER suid=USER fsuid=USER egid=USER sgid=USER fsgid=USER tty=(none)
>>>>>> ses=1 comm=thunderbird exe=/usr/lib64/thunderbird/thunderbird
>>>>>> subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
>>>>>> key=watched_users
>>>>>> Why no PATH entry?  I have them for things like open:
>>>>> The kernel guys can probably answer this accurately.
>>>> I would have thought that they would have chimed in by now. Since they didn't
>>>> you might want to file an issue on github. I think you found a problem that
>>>> someone should look into some day.
>>> One of them (me) is on vacation, and only dealing with emergencies as they arise - this isn't one of those.  I'm not sure what Richard is doing, but you'll get an answer when I'm back in "the office" if Richard doesn't comment first.
>>>
>>> That said, it's always okay to file a GH issue.
>> Generally speaking the only syscalls which generate a PATH record are
>> those syscalls which take a file pathname as an argument.  The reason
>> why is that pathnames are notoriously transient and are only valid for
>> the instant they actually resolve to a file; in fact it is possible
>> that by the time an open(2) syscall returns the fd to the calling
>> application, the file it opened may no longer be accessible at the
>> pathname used to open the file.  It really is that crazy.
>>
>> In the case of ftruncate(2) we see that the syscall doesn't take a
>> pathname argument, it takes an open file descriptor, this is why you
>> don't see a PATH record.  If we compare it to a syscall which does
>> take a pathname, e.g. chown(2), we will generate a PATH record.  Take
>> the example below where we use the example program found in the
>> chown(2) manpage:
>>
>> # touch /tmp/test
>> # auditctl -w /tmp/test -k path_test
>> # gcc -o chown_test -g chown_test.c
>> # ./chown_test
>> ./chown_test <owner> <file>
>> # ./chown_test nobody /tmp/test
>> # ausearch -i -k path_test
>> ----
>> type=CONFIG_CHANGE msg=audit(02/10/2020 17:50:45.251:255) : auid=root ses=5 subj
>> =unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 op=add_rule key=path_test
>> list=exit res=yes
>> ----
>> type=PROCTITLE msg=audit(02/10/2020 17:51:29.356:258) : proctitle=./chown_test n
>> obody /tmp/test
>> type=PATH msg=audit(02/10/2020 17:51:29.356:258) : item=0 name=/tmp/test inode=7
>> 0660 dev=00:21 mode=file,644 ouid=root ogid=root rdev=00:00 obj=unconfined_u:obj
>> ect_r:user_tmp_t:s0 nametype=NORMAL cap_fp=none cap_fi=none cap_fe=0 cap_fver=0
>> cap_frootid=0
>> type=CWD msg=audit(02/10/2020 17:51:29.356:258) : cwd=/root/tmp
>> type=SYSCALL msg=audit(02/10/2020 17:51:29.356:258) : arch=x86_64 syscall=chown
>> success=yes exit=0 a0=0x7ffc820c0603 a1=nobody a2=unset a3=0x40044e items=1 ppid
>> =1678 pid=35451 auid=root uid=root gid=root euid=root suid=root fsuid=root egid=
>> root sgid=root fsgid=root tty=pts1 ses=5 comm=chown_test exe=/root/tmp/chown_tes
>> t subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=path_test
>>
>> ... in the example above we see that we do have a PATH record, as expected.
>>
> So, this is all reasonable.  But why do I get this with fchown which also
> takes a file descriptor?
>
> ...
>
> It's this disparity between fchown and ftruncate that caught my attention.

fchown changes the security state (mode bits) of the file,
whereas ftruncate changes the content of the file. The former
is clearly security relevant, the latter is not.


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

