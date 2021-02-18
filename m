Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C3A1031EFF2
	for <lists+linux-audit@lfdr.de>; Thu, 18 Feb 2021 20:37:00 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-RrJEmPHdNr6SaNVhTr5_Xg-1; Thu, 18 Feb 2021 14:36:56 -0500
X-MC-Unique: RrJEmPHdNr6SaNVhTr5_Xg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7DFB6EE24;
	Thu, 18 Feb 2021 19:36:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9BA160BE5;
	Thu, 18 Feb 2021 19:36:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5192B18095CB;
	Thu, 18 Feb 2021 19:36:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11IJYmKd031074 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 18 Feb 2021 14:34:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 557F211F4B2; Thu, 18 Feb 2021 19:34:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50A9911F4A9
	for <linux-audit@redhat.com>; Thu, 18 Feb 2021 19:34:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30CD4185A7BC
	for <linux-audit@redhat.com>; Thu, 18 Feb 2021 19:34:45 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
	[209.85.208.44]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-460-0i4A8YF3NvqR-FSulFhytQ-1; Thu, 18 Feb 2021 14:34:42 -0500
X-MC-Unique: 0i4A8YF3NvqR-FSulFhytQ-1
Received: by mail-ed1-f44.google.com with SMTP id n1so5822126edv.2
	for <linux-audit@redhat.com>; Thu, 18 Feb 2021 11:34:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=c4NCOHqlaolHGqdkr1amleTsjWwegvUhICByRNknl9o=;
	b=GrOm33gklkSmtCQo6b7wZvW3LrRLTO/jpgrT/rkZbYVBblmLXpp3M8/E0RQ/IpzMxg
	6Rmc+46IfF1AkjqqH3po/tYB8U5FY2KPnzbGVLqff1Tt7ZrbFJqjH6yXGbIydpKbOQoW
	ooOlWPyrPR8bJ04PDLrSmFwH7es9aoqQgLQnvKO9wH79ZxuKHYUVaWIPrrzaW5tJIYyg
	lvvfeyaSshx4RqLqTD+5eO3EILoR1+HzR8B318kuD0BtecXKMAz3N9OpJ340B1kO4SXV
	ZUri0KaejdB1Ssixl1tWPCic8l1HNidu8i7DWGNhYqLNvz1RdtsdSFpJUtamgPul1eKT
	Vuhw==
X-Gm-Message-State: AOAM531icIxPxjkh1uA7ypZ3NhUZWZlX68X8UIFnCP3QGIAQza6LV8u2
	TLW3YcyWeddqSczIzBgG3ek7Vea/jQeqtttHT5qU
X-Google-Smtp-Source: ABdhPJwpsC+vm8CzQEpfKZRHzdetnGTBoYfUnbFd5gkMtykFEPATHNNgEnqXIQm7R/p6kcs7bbTH95jkroqxH+lam48=
X-Received: by 2002:aa7:c5d4:: with SMTP id h20mr5541872eds.161.1613676881441; 
	Thu, 18 Feb 2021 11:34:41 -0800 (PST)
MIME-Version: 1.0
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 18 Feb 2021 14:34:30 -0500
Message-ID: <CAHC9VhSiq5gqY1bfouia4GwYsE9MGGXnUOqwEtHi2u0-1=8aZQ@mail.gmail.com>
Subject: security_task_getsecid() and subjective vs objective task creds
To: linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
	linux-audit@redhat.com
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
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

When looking into a problem I noticed that audit was recording the
wrong subject label for a process.  Doing a bit of digging I realized
this was caused by the SELinux security_task_getsecid() implementation
returning the objective security label (taken from task->real_cred),
and not the subjective security label (taken from task->cred).

Looking around at the other LSMs which implement this hook, Smack and
AppArmor, it appears they both do the same thing: return the objective
security ID for the process.  Looking quickly at the various non-LSM
callers of the security_task_getsecid() hook, it unfortunately looks
like all of them expect the subjective security ID to be returned.
The only caller I'm not 100% confident in is binder, but from what I
can tell it looks like they are expecting the subjective ID too.

At least we are consistently wrong :)

How do we want to fix this?  The obvious fix is to change the SELinux,
AppArmor, and Smack security_task_getsecid() implementations to return
the subjective security ID (->cred), and likely make a note in
lsm_hooks.h, but if someone can see a case where we would need both
the subjective and objective security labels speak up and we can
introduce a new hook for the subjective label, and likely add a "_obj"
to the end of the existing hook to help make it more clear.  If
neither of those options are acceptable, we could convert all of the
existing callers to use something like the line below (assumes
current), but that is the least appealing option as far as I'm
concerned.

  security_cred_getsecid(current_cred(), &sid);

Opinions?

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

