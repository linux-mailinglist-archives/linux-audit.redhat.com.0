Return-Path: <linux-audit-bounces@listman.redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	by mail.lfdr.de (Postfix) with ESMTP id AE9A231CFEC
	for <lists+linux-audit@lfdr.de>; Tue, 16 Feb 2021 19:12:55 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-ANl1xa-TP4mhYGFyX0ddjg-1; Tue, 16 Feb 2021 13:12:50 -0500
X-MC-Unique: ANl1xa-TP4mhYGFyX0ddjg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6793B8030CC;
	Tue, 16 Feb 2021 18:12:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 423651975F;
	Tue, 16 Feb 2021 18:12:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E9D2718095CC;
	Tue, 16 Feb 2021 18:12:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11DHR3uL031925 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 13 Feb 2021 12:27:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BC7E86D9DF; Sat, 13 Feb 2021 17:27:03 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6C4E6D9E1
	for <linux-audit@redhat.com>; Sat, 13 Feb 2021 17:27:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E46E2858F17
	for <linux-audit@redhat.com>; Sat, 13 Feb 2021 17:27:00 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
	[209.85.218.42]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-460-YZNKzGc7Oa6oBoHGBBBt4w-1; Sat, 13 Feb 2021 12:26:57 -0500
X-MC-Unique: YZNKzGc7Oa6oBoHGBBBt4w-1
Received: by mail-ej1-f42.google.com with SMTP id y9so4597931ejp.10
	for <linux-audit@redhat.com>; Sat, 13 Feb 2021 09:26:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=MxnpPs0+47w37I9nFiULng/p91nDzPZYER15zppZYso=;
	b=VsZR573eQz0Ocr0zqOHRfL3a4BTbEjCWZPPssQsFn1g/VvH08PUMimKZdxTe3qAu1V
	GQTdJsN4XTsmVoU/h5ZuiYaFL7ZZ96OdHAgJYFougzDjVxXknWPMHiSibvTM91Wsvnw2
	KkdOlp7EZC0TzBTFHcPMF/S6UxU3tyy6avFb+/UBSXx2fPTHFeR6pvmfu6lvnmK7qTFg
	Hjphc7FLiyJfKp5wymokGOEWGatuj//7Ctq9asrgN8doM7e/H4nCvlJWWtjpVXpKBlbD
	lSX1tcaTkriOTACGpg/l96xEHkNRaXIICATuuzKy3kYIDMPNRuVBvAw69sAVBRRPWt3c
	FZkQ==
X-Gm-Message-State: AOAM533XQAqnUbeaCKgbC1QsAuet6mO/KusTURAWPjE2pwSLrJ6gis9K
	dL87ffZLoi62oMMGGWstIuCgcEBMe6IJxAj8tixg8VN5lmyuXQ==
X-Google-Smtp-Source: ABdhPJwNTN50K68OHp6nfrCk8CcZZeBYvmRlKIy9A7PSy9bKOIuFmEQsyX4fVo/qFtbynuCs41704oB3FCMOrPV4ZRE=
X-Received: by 2002:a17:906:af41:: with SMTP id
	ly1mr7960445ejb.525.1613237216372; 
	Sat, 13 Feb 2021 09:26:56 -0800 (PST)
MIME-Version: 1.0
From: Alan Evangelista <alan.vitor@gmail.com>
Date: Sat, 13 Feb 2021 14:26:45 -0300
Message-ID: <CAKz+TUs86e8Rh=DmSGOjK+KEjP6TLAhGoe3MdhN6xwBT3eWrLQ@mail.gmail.com>
Subject: Building user-space audit
To: linux-audit@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 16 Feb 2021 13:11:57 -0500
X-BeenThere: linux-audit@listman.redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.listman.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@listman.redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@listman.redhat.com>
List-Help: <mailto:linux-audit-request@listman.redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@listman.redhat.com?subject=subscribe>
Sender: linux-audit-bounces@listman.redhat.com
Errors-To: linux-audit-bounces@listman.redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@listman.redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: listman.redhat.com
Content-Type: multipart/mixed; boundary="===============8592638458443414338=="

--===============8592638458443414338==
Content-Type: multipart/alternative; boundary="000000000000386e9905bb3b0f94"

--000000000000386e9905bb3b0f94
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I'm trying to build the user-space part of the Linux Auditing Framework in
https://github.com/linux-audit/audit-userspace. First, the README tells me
to "see the README-install file" for building instructions and there is no
such file.

Second, I tried the standard build procedure using autotools:

aclocal; autoconf; automake; ./configure; make

./configure fails with the following error message:

configure: error: zos remote support was requested but the openldap library
was not found

- Is there any out-of-the-box way to build a *minimal* auditd for the
x86_64 platform or I'd need to remove non-essential features such as zos
remote support manually (in this case, removing it from configure.ac) ?
- If there is not, where are the build dependencies documented?

Thanks in advance.

--000000000000386e9905bb3b0f94
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m trying to build the user-space part of the Linux A=
uditing Framework in=C2=A0<a href=3D"https://github.com/linux-audit/audit-u=
serspace">https://github.com/linux-audit/audit-userspace</a>. First, the RE=
ADME tells me to &quot;see the README-install file&quot; for building instr=
uctions and there is no such file.=C2=A0<div><br></div><div>Second, I tried=
 the standard build procedure using autotools:=C2=A0<div><br></div><div>acl=
ocal; autoconf; automake; ./configure; make</div><div><br></div><div>./conf=
igure fails with the following error message:</div><div><br></div><div>conf=
igure: error: zos remote support was requested but the openldap library was=
 not found<br></div><div><br></div><div>- Is there any out-of-the-box way t=
o build a *minimal* auditd for the x86_64 platform or I&#39;d need to remov=
e non-essential features such as zos remote support manually (in this case,=
 removing it from <a href=3D"http://configure.ac">configure.ac</a>) ?</div>=
<div>- If there is not, where are the build dependencies documented?</div><=
div><br></div><div>Thanks in advance.</div></div></div>

--000000000000386e9905bb3b0f94--

--===============8592638458443414338==
Content-Type: text/plain; charset=WINDOWS-1252
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@listman.redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit
--===============8592638458443414338==--

