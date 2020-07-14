Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 2DEE021E45C
	for <lists+linux-audit@lfdr.de>; Tue, 14 Jul 2020 02:12:17 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124--9iBVERDMtSJHdqcYKrXCg-1; Mon, 13 Jul 2020 20:12:13 -0400
X-MC-Unique: -9iBVERDMtSJHdqcYKrXCg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1ABE10059B6;
	Tue, 14 Jul 2020 00:12:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B5F227CCB;
	Tue, 14 Jul 2020 00:12:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 87F97180954D;
	Tue, 14 Jul 2020 00:11:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06E0Bkm1021464 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 20:11:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C9C8E2157F24; Tue, 14 Jul 2020 00:11:46 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C56342157F23
	for <linux-audit@redhat.com>; Tue, 14 Jul 2020 00:11:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A493196EF81
	for <linux-audit@redhat.com>; Tue, 14 Jul 2020 00:11:44 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-60-7TO6poAeMcuVzwzI5LFt7g-1; Mon, 13 Jul 2020 20:11:42 -0400
X-MC-Unique: 7TO6poAeMcuVzwzI5LFt7g-1
Received: by mail-ej1-f65.google.com with SMTP id br7so5695723ejb.5
	for <linux-audit@redhat.com>; Mon, 13 Jul 2020 17:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=w3tCvLUj5e2033+1XVKjkRbJlGVk2NZ4R6PmNEGkAM4=;
	b=b3zYFKV5dY299XmYBMxvgTKpKe7WcvqEXY2+0AjjYMfGgXJ9FmnTVIlSxcux3qVRtt
	rgUl78jTFU2arKgbUpJn9RiL5m2I+p/C3tsZ4Zbleq/M8BV1noAW/nDI3IR+MKhiQvq2
	H2rf+DN+QPsJn1wMN6waNlc00OgaeMfdzOsFymM5E2tdUfPSFwZFudwyksWO2Uw+DRMK
	DWrmIwCNdQwOX1WrZDIDsGMK0KDMQce8ed6+1DFYIA4C0BQn6Ret3NHD9qtcMJxamq9H
	fwsL7wmDff75KnQvRDe/qi0Hm9s/15dRUSQB5nGz/3x0KwHzFp0L2gWGVmvUbN1DWOoP
	SKlw==
X-Gm-Message-State: AOAM531EMsFBekWxSBvoRG41/muiT99qXnFF3k08qi96kOtmlSzg48zz
	CwM/JXCI8vhGXkhQL2K4A1BlSpm5yrhgqwhf8OJlCbQ=
X-Google-Smtp-Source: ABdhPJxEj+yY4HWZZR0iFMkfa/9lubsHvxIMWS+SeFcsClYWkgljlo9LuzeS4HdqstfzkSvHI2vMbF75eGbf88I8G8M=
X-Received: by 2002:a17:906:1a59:: with SMTP id
	j25mr1996949ejf.398.1594685500884; 
	Mon, 13 Jul 2020 17:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <b62d4388b488dedfa2758f32e6d1e5414179b4f2.1593796497.git.rgb@redhat.com>
	<CAHC9VhReURKRe63t7mudKpkW0aVNpCmF=UWHSof1uvRkmZ8HTQ@mail.gmail.com>
	<20200713174014.mjsdugomgjtl3kgz@madcap2.tricolour.ca>
	<9ec00f40-e7e9-950e-4ed9-48533a9ee223@schaufler-ca.com>
	<20200713200214.qh3vnhcjozpnqf2l@madcap2.tricolour.ca>
	<e2a183b2-35f4-8493-c485-8bf86e5866e9@schaufler-ca.com>
In-Reply-To: <e2a183b2-35f4-8493-c485-8bf86e5866e9@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 13 Jul 2020 20:11:29 -0400
Message-ID: <CAHC9VhQUiqkeygtEWAa=j8Dxysh_jSWhf33CYo7i2Tij26FH2w@mail.gmail.com>
Subject: Re: [PATCH ghak122 v1] audit: store event sockaddr in case of no rules
To: Casey Schaufler <casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, Eric Paris <eparis@parisplace.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 13, 2020 at 7:09 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> ... but it does appear that I could switch to using your audit_alloc_local().

In my opinion, linking the audit container ID and LSM stacking
patchsets would seem like a very big mistake, especially since the
consolidation you are describing could be done after the fact without
any disruption to the kernel/userspace interface.  I would strongly
encourage both patchsets to remain self-contained if at all possible
so as to not jeopardize each other.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

