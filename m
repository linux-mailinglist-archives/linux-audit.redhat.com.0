Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id CE1CD189FE6
	for <lists+linux-audit@lfdr.de>; Wed, 18 Mar 2020 16:46:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584546366;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uSVbd5i1WN7qogSzUMIMofph0Q2MHp97kXPCiWW0aoQ=;
	b=Ra1ULYjjMRYnLCbPX69SVXtxvHIq4YtTZyDROnbujUW0No4NDhyWhQAMYhxpwpzp+NS6+Q
	HSB172TijOxOd7m5wQo1b4g8YnuPywfly47QToKQ01AcPtvz62K3lyfhZemKBLQttKKZw2
	o7zfWlLmJfPyQjjG3MjKN1c97A77eOE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-L3O4-BQFMd6V0kje-H2AAg-1; Wed, 18 Mar 2020 11:46:04 -0400
X-MC-Unique: L3O4-BQFMd6V0kje-H2AAg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B498F18B9FC1;
	Wed, 18 Mar 2020 15:45:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08B835C1A0;
	Wed, 18 Mar 2020 15:45:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D4FDC18034E9;
	Wed, 18 Mar 2020 15:45:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02IFBkDx020642 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 18 Mar 2020 11:11:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4FEF41069282; Wed, 18 Mar 2020 15:11:46 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B3E21005E53
	for <linux-audit@redhat.com>; Wed, 18 Mar 2020 15:11:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 018DD907792
	for <linux-audit@redhat.com>; Wed, 18 Mar 2020 15:11:44 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
	[209.85.160.174]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-357-ERMlNymXN2eoAGSaxAcQxA-1; Wed, 18 Mar 2020 11:11:41 -0400
X-MC-Unique: ERMlNymXN2eoAGSaxAcQxA-1
Received: by mail-qt1-f174.google.com with SMTP id l20so20946051qtp.4
	for <linux-audit@redhat.com>; Wed, 18 Mar 2020 08:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to;
	bh=cBYW0UwDlFqu6Mtk8zs15gpSjZXGrnPCv8HSY8PeaT0=;
	b=AhLHjSlna1MS3M8LqtfLIU40LG5l2lZ48Nw3DHvQKMZX6rMqlhJNpC6kAwT8PGZ28P
	uey1JKuiljmAuUjcEGvxlNcT1FLc6qrMJJQ2af9CU8AphXj+UlflxASClp6a4ni8TpPm
	5t102PL+YzxK9cUL2pgbXQLXxg/88omdHo+vCTfgFbzTfqL5AKM7bULZix72gPGFuhRG
	V4V0wpPNLl5U1AKYD8ZsC2cA3QM2qadw1utcqcPw8Z2h+F7dn2OtzeQk9KQ7wu+Enwef
	oeS5I1gYWbLTvdMybVA6On4bfeKG0gXz30lLnGJ2CBkLZe2evMgvfNuydsFQW3+jsoXS
	OxfA==
X-Gm-Message-State: ANhLgQ2ccCjx0dHDXiIjpgRVKNT8WAM0MwIw88DxoF/EL+hFePRGIjR6
	3smGjTb3eMvVl8ErghxlBNTlXw==
X-Google-Smtp-Source: ADFU+vvUA72DBxyNp4q1pMyzL84thCC7GSkB4NfFgcsfz3Whg9bCEaA9sHL3dUFzLZZ257AFmZgX8g==
X-Received: by 2002:ac8:6f58:: with SMTP id n24mr4820237qtv.63.1584544299759; 
	Wed, 18 Mar 2020 08:11:39 -0700 (PDT)
Received: from chatter.i7.local (107-179-243-71.cpe.teksavvy.com.
	[107.179.243.71]) by smtp.gmail.com with ESMTPSA id
	k66sm4275984qke.10.2020.03.18.08.11.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Mar 2020 08:11:38 -0700 (PDT)
Date: Wed, 18 Mar 2020 11:11:36 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: Looking for help testing patch attestation
Message-ID: <20200318151136.kfjf6sdkjikptuwj@chatter.i7.local>
Mail-Followup-To: Paul Moore <paul@paul-moore.com>, selinux@vger.kernel.org,
	linux-audit@redhat.com
References: <20200317221237.vrkru2kdc63zq3vi@chatter.i7.local>
	<CAHC9VhTF8MH7UodKLGmAmMNzUeh-68W92pivnBgJfGhWV5F7HQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhTF8MH7UodKLGmAmMNzUeh-68W92pivnBgJfGhWV5F7HQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02IFBkDx020642
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Wed, 18 Mar 2020 11:45:42 -0400
Cc: selinux@vger.kernel.org, linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Mar 17, 2020 at 06:51:38PM -0400, Paul Moore wrote:
> You might want to extend this test to the LSM list as well.  I'm
> refraining from CC'ing them on this email because I don't want to
> spoil your beta test rollout, but I think it would be a good thing to
> do.

I'll do that, thanks! I'll also loop in kernel-hardening folks.

> Speaking as the person who merges patches for both the SELinux and
> audit kernel subsystems, I look at every patch I merge; I don't
> blindly merge patches (even from certain "trusted" individuals).
> Simply put, I've always considered that to be part of the job.  While
> the patch attestation could provide some assurance about who created
> the patch (assuming a reasonable web-of-trust), and that it hadn't
> been tampered with, I feel it is more important to review correctness
> than it is to guarantee provenance.  If you ever develop a tool which
> can help with the correctness part, I'll gladly jump to the front of
> the line to test that one! ;)

Yes I understand -- I view this as an auxiliary feature that helps 
maintainers in their duties, but certainly doesn't aim to replace due 
diligence. I am most worried about the following scenario:

1. a maintainer receives a long series of patches that arrives into 
   their inbox
2. they carefully review the patches and decide to merge them
3. they use "b4 am" to grab that patch series from lore.kernel.org
4. however, the archive has been manipulated and returns patches 
   containing malicious edits, which get merged because the maintainer 
   assumes that what "b4 am" returns is the same as what they reviewed

Cryptographic attestations helps hedge against this scenario by removing 
any implicit trust from the centralized system like lore.kernel.org (or 
patchwork.kernel.org, for that matter).

> Having said that, I'm happy to see work going into tools like this,
> and at some point I'll look into adding it into my workflow for an
> extra level of safety (although I'm on the fence about making it
> mandatory for submissions).  Sorry to disappoint, but I'm probably not
> the best test monkey right now.

All good, this is why I'm casting the net wide looking for initial 
adopters. :)

Best regards,
Konstantin


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

