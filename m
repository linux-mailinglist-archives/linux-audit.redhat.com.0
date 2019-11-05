Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1C361EF1D2
	for <lists+linux-audit@lfdr.de>; Tue,  5 Nov 2019 01:18:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572913131;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mQJDFxJivJHpmtXZmvRrNKHG1k2jzLSGY4fXpDUbnxU=;
	b=aBOqtj1IiClN36dWvhCuCZbRXAGvbQWr9heOhZOmJQdaKq1kj9Q6KBs1TGNAORYQeQ2WjS
	6jNDUF019hryGb5L3I5uthsdmUslh4VnTY2hWxP+MFUhNTId21gU2jO+M+EwwJeCvblKPn
	TiUUZpkYAvk4kWhgGwdX7Hrau8X15Vg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-pxmZLwNxMna8mGslQzIQ2w-1; Mon, 04 Nov 2019 19:18:49 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99D5F477;
	Tue,  5 Nov 2019 00:18:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C5B35DA66;
	Tue,  5 Nov 2019 00:18:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6A5AD18089C8;
	Tue,  5 Nov 2019 00:18:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA50Ib3H023907 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 4 Nov 2019 19:18:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 14F3C60FC1; Tue,  5 Nov 2019 00:18:37 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx23.extmail.prod.ext.phx2.redhat.com
	[10.5.110.64])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BC8260F8E
	for <linux-audit@redhat.com>; Tue,  5 Nov 2019 00:18:34 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
	[209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C9B5110C72C6
	for <linux-audit@redhat.com>; Tue,  5 Nov 2019 00:18:33 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id y127so13650518lfc.0
	for <linux-audit@redhat.com>; Mon, 04 Nov 2019 16:18:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vUgflTX25k1Ki/MI0Trh+WdwNq4cRxqlY0HLe+0NwBo=;
	b=B9dU4gvKoqtBN6SqCVyyyfR8nm0bkbdaUuXQ2LGFSz4NG/gReGMVz8MK1/JbV74AC3
	wnSxnkP2kWtmARxqTQp++q1kQafuLWPHNqUwiS/2DYAg8KAmN8/51YXYgGiERnAtMmR0
	tbXkH+V5luXplAg9Bom/ztKSBg7JLqjV9rTp3lzniBpSrkhPDC1Mfk2m9owfnm4prcou
	b8WTJlZxt06lQqOQ7einFmDUrGKpHnSMOnx8FwSBfzXP62K10LmEHsCp1G5VQBpkWmvN
	VtipYGnK6uCLOMuLWkZX9i3cP7J2Ndf6hVs6OS//e5ka+GaZ7YLB5FrNa6SUNxobChPW
	RiZg==
X-Gm-Message-State: APjAAAUvphSaN/yun0lpM9x8TKFaOfMPZY2xyyd/AVD9qFMUzQnPampL
	4RIr6mtWoGcisy2R4LhYZ/VCrRoYF46BBwEZKYsTp5Y=
X-Google-Smtp-Source: APXvYqxNKL/m/B1XZJjg/ytyudbJABRhtq9qbV/DfG2WbxAYKev4QbFodu7XU6VYYBc2D7IP0YnrDwgwbT38oBpINn4=
X-Received: by 2002:ac2:5967:: with SMTP id h7mr17927716lfp.119.1572913112082; 
	Mon, 04 Nov 2019 16:18:32 -0800 (PST)
MIME-Version: 1.0
References: <20190809141831.GB9377@krava> <2985228.9kGasGrDWd@x2>
	<20190812075922.GA3012@krava> <5293423.BmRMD7FMx9@x2>
	<20190812143257.GC23992@krava>
	<20190814073323.GA16363@krava> <20190820135453.GH24105@krava>
	<20191104140518.67471654@redhat.com>
In-Reply-To: <20191104140518.67471654@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 4 Nov 2019 19:18:20 -0500
Message-ID: <CAHC9VhTE3pVp6m+9uJL=Xo7LMqv5UzqogVXWet=cpuVxutbQSQ@mail.gmail.com>
Subject: Re: [RFC] audit support for BPF notification
To: Jiri Benc <jbenc@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.64]);
	Tue, 05 Nov 2019 00:18:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]);
	Tue, 05 Nov 2019 00:18:34 +0000 (UTC) for IP:'209.85.167.42'
	DOMAIN:'mail-lf1-f42.google.com' HELO:'mail-lf1-f42.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.42 mail-lf1-f42.google.com 209.85.167.42
	mail-lf1-f42.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.64
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: Kozina <skozina@redhat.com>, Yauheni Kaliuta <yauheni.kaliuta@redhat.com>,
	=?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>,
	Jesper Dangaard Brouer <brouer@redhat.com>,
	Carvalho de Melo <acme@redhat.com>, linux-audit@redhat.com,
	Rashid Khan <rkhan@redhat.com>, Petr Matousek <pmatouse@redhat.com>,
	Jiri Olsa <jolsa@redhat.com>, Vlad Dronov <vdronov@redhat.com>
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
X-MC-Unique: pxmZLwNxMna8mGslQzIQ2w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2019 at 9:41 AM Jiri Benc <jbenc@redhat.com> wrote:
> Seems there have been no reply to this...
>
> Jiri, what is the current status?
>
> Vlad, what is the Product Security's view on this? Is the audit support
> for bpf programs loading/unloading a requirement for full support of
> eBPF (as opposed to tech preview)?

As a reminder, this is a public mailing list that focuses on the
technical development of the upstream Linux audit project; Red Hat
product decisions should not be discussed here.

--=20
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

