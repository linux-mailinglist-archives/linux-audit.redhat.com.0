Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 534611BE28
	for <lists+linux-audit@lfdr.de>; Mon, 13 May 2019 21:44:32 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB2AB859FC;
	Mon, 13 May 2019 19:44:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04B701001F40;
	Mon, 13 May 2019 19:44:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6A28641F56;
	Mon, 13 May 2019 19:44:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4DJiBrs027302 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 13 May 2019 15:44:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BCECC608B9; Mon, 13 May 2019 19:44:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6B5C60856
	for <linux-audit@redhat.com>; Mon, 13 May 2019 19:44:07 +0000 (UTC)
Received: from mail-it1-f170.google.com (mail-it1-f170.google.com
	[209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6FBA759467
	for <linux-audit@redhat.com>; Mon, 13 May 2019 19:44:06 +0000 (UTC)
Received: by mail-it1-f170.google.com with SMTP id 9so986333itf.4
	for <linux-audit@redhat.com>; Mon, 13 May 2019 12:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=pvUpOSTIt4P0202FWCSXtJL1i9iCFHTu2CflsqeXtv0=;
	b=rM5jiEvB6oHlwzhEp64kV96WdVCATHyv9ZFKWmvOPwcGVm5p2JICdAowiBq4hIW9XR
	ptbguc2Ln+tejkdUlqpSj1PY7YNcNTe1zC/Xlr3gCik96tppDIT/3SfaLYN4UZINc7jC
	qCJdR0iqX75IhFDJYLis49+OHPHHXpgIsMxgL0wa5STAYTIBE8MBnP6Y+ShP76fbM8Vq
	4XrH0fXxqCywSwLgfoC/yFJQ7h7SWU70bI5rBUiSn5raysd0rbLs7iRlVmE+PMUc/1Mh
	JOe8x/K2GyNTcNcXVHD+XCFRGw/PaIUet4BXanOXvwSt37YV2AzSvPnKR43xcqqH9UUe
	AGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=pvUpOSTIt4P0202FWCSXtJL1i9iCFHTu2CflsqeXtv0=;
	b=Eb9fnlj8wMuLiC6rlMt53W6xqOl9vcFSp52CqXSjzv7ZwV4Ds+t+clxdrmLVkSvWUI
	F0FXiW75G6Yzd3jP1hs9zZ4Ac6A01wrXpyAAYBQ+acZFmCqnTftt5/7ea+XuKQ7rDY0d
	FmcKsV/qd9EDDwy2oToAwHKShljGLdun5Nu3DnOctIIujQUuxga7o0s3DvIAWltLfiMB
	XAqBhX1kbL9puB8QiMp3b1/yCJRcFPgxRIxHj0ncO2ipUjHFZ6apvBowMCN7OtjMuxU9
	DWr8m8cIS5zMICAMzk4P/zv2SMmC3aNaaOvQ0xtS0Jn7Q1ItSLo/iilri4AQsd5tk/+1
	rZ+w==
X-Gm-Message-State: APjAAAVOvHQhSa/A03UstdiKVmNDRrJVyihkDCV1rTqXXSk0T+WSHMAW
	YmMkvHdNjQSvI2gHMj+udoRI3TBNMDCDlOnwkJy7V1Jr71U=
X-Google-Smtp-Source: APXvYqzooglDhWi/PXmBXASSXmV1RHP9Kz5whgfdhtbXTuQwu7VEAwTdA+1jXiLc7vfEYTfoa0RGvfmWeYsBMjt6XE8=
X-Received: by 2002:a02:a10d:: with SMTP id f13mr20390448jag.23.1557776645554; 
	Mon, 13 May 2019 12:44:05 -0700 (PDT)
MIME-Version: 1.0
From: "Ondra N." <ondrysak@gmail.com>
Date: Mon, 13 May 2019 21:43:54 +0200
Message-ID: <CADK+bLxes0UKt0Uoj64h=vNhrJfA0RVj1Ai8onLYbMCG-5uB6g@mail.gmail.com>
Subject: Auditing write syscall
To: linux-audit@redhat.com
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 13 May 2019 19:44:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Mon, 13 May 2019 19:44:06 +0000 (UTC) for IP:'209.85.166.170'
	DOMAIN:'mail-it1-f170.google.com'
	HELO:'mail-it1-f170.google.com' FROM:'ondrysak@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.109  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	SPF_PASS) 209.85.166.170 mail-it1-f170.google.com 209.85.166.170
	mail-it1-f170.google.com <ondrysak@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Content-Type: multipart/mixed; boundary="===============4622426775596742905=="
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Mon, 13 May 2019 19:44:30 +0000 (UTC)

--===============4622426775596742905==
Content-Type: multipart/alternative; boundary="00000000000099120c0588ca235a"

--00000000000099120c0588ca235a
Content-Type: text/plain; charset="UTF-8"

Hello,

I would like to ask a question about auditing write syscalls.  I am trying
to monitor all filesystem changes in a specific directory and process the
changes in near real time - audispd, was very helpful with that.

What concerns me is what if a filedescriptor is kept open for long periods
of time and written to once in a while? Only the open syscall is logged
when using a rule like this one.

auditctl -w /tmp/rnd_pop -p wa -k test_key

I was thinking that maybe being more explicit about what I want to do could
help like setting up a rule like this one.

auditctl -a always,exit -F dir=/tmp/rnd_pop -F perm=w -F succes=1 -k
test_key

But it doesnt seem to work for me, I guess I cannot filter write syscall by
directory because nothing ever shows up in the audit.log with a rule like
this.

What is the intended way to achieve logging of write syscalls in specific
directory, am i missing something? Should I check myself if the file is
still open when event is being processed and act accordingly?


Best regards,

Ondrej

--00000000000099120c0588ca235a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello, <br></div><div><br></div><div>I would like to =
ask a question about auditing write syscalls.=C2=A0 I am trying to monitor =
all filesystem changes in a specific directory and process the changes in n=
ear real time - audispd, was very helpful with that.</div><div><br></div><d=
iv>What concerns me is what if a filedescriptor is kept open for long perio=
ds of time and written to once in a while? Only the open syscall is logged =
when using a rule like this one.</div><div><br></div><div><code>auditctl -w=
 /tmp/rnd_pop -p wa -k test_key</code> </div><div><br></div><div>I was thin=
king that maybe being more explicit about what I want to do could help like=
 setting up a rule like this one.</div><div><p><code>auditctl -a always,exi=
t -F dir=3D/tmp/rnd_pop -F perm=3Dw -F succes=3D1 -k test_key</code></p><p>=
<code>But it doesnt seem to work for me, I guess I cannot filter write sysc=
all by directory because nothing ever shows up in the audit.log with a rule=
 like this.</code></p><p><code>What is the intended way to achieve logging =
of write syscalls in specific directory, am i missing something? Should I c=
heck myself if the file is still open when event is being processed and act=
 accordingly?<br></code></p><p><code><br></code></p><p><code>Best regards,<=
/code></p><p><code>Ondrej<br></code></p><p><code><br></code></p></div></div=
>

--00000000000099120c0588ca235a--


--===============4622426775596742905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============4622426775596742905==--

