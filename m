Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A099B2B946C
	for <lists+linux-audit@lfdr.de>; Thu, 19 Nov 2020 15:21:52 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-wjN7Mo8CMXW75KsSnyCepA-1; Thu, 19 Nov 2020 09:21:49 -0500
X-MC-Unique: wjN7Mo8CMXW75KsSnyCepA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1DFB80EDB2;
	Thu, 19 Nov 2020 14:21:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 906865D9C2;
	Thu, 19 Nov 2020 14:21:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7CCFF180954D;
	Thu, 19 Nov 2020 14:21:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AJEL9gO010388 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 19 Nov 2020 09:21:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4EB0C2026D76; Thu, 19 Nov 2020 14:21:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A07C2026D5D
	for <linux-audit@redhat.com>; Thu, 19 Nov 2020 14:21:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6A8780018D
	for <linux-audit@redhat.com>; Thu, 19 Nov 2020 14:21:06 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-473-32lexBmlN1WoDdLVvLfMmg-1; Thu, 19 Nov 2020 09:21:04 -0500
X-MC-Unique: 32lexBmlN1WoDdLVvLfMmg-1
Received: from mail-pf1-f199.google.com ([209.85.210.199])
	by youngberry.canonical.com with esmtps
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <andreas.hasenack@canonical.com>) id 1kfkY9-0006oh-VV
	for Linux-audit@redhat.com; Thu, 19 Nov 2020 14:04:38 +0000
Received: by mail-pf1-f199.google.com with SMTP id 9so3998879pfn.5
	for <Linux-audit@redhat.com>; Thu, 19 Nov 2020 06:04:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=cP6U9egiuwdLw6nQFpwFjy4cPM6hzUSuuKCbgH3luTA=;
	b=CpzkuMlWFNdxr7pFt9cb5B5tIz/XJNUjt6W5TnVBg0Dt4ud2EeLgTv1AD8fMthGoys
	0T5XmQ4oz5lHcOIhO0WuCc/hxYw/j71af/EeEd68JzZU2QejfWUiZoIvcKUsyHsVVvMe
	ZieA5zFOkM6Yjn4mQDOTzf/a3sTqSeL2/O6WiM6LqtYYLqvTpcP5NUZwF0QulgJGTqR/
	imCfvrgeBr2usHA9VIth24jprWizYK4gm/M8aEaAMLr8+kfhtFdLDhAtIGPilkK1Rlac
	6ZMiJhsrF3C2U8Q5nxzHx1pn+Ic5zeFHkIhLlS4ZfSd5cBhDESAwDKkOPKqKLB3kTu2a
	tOrg==
X-Gm-Message-State: AOAM530G/j8/a0NuToaYvxLdGoPwAFL2977YFE1+IX1klUTKi13omlmj
	aasBelPQB+Th8xRl3gBVRs0ynkqdQA8B09qw6zJEfIZ4/mKIu6dqciaKRq+N3fEVG2v7XO7oWps
	8nBLgi7zAYg/ggmk4sKRHp/Rl6O5Y+v5y19VzQmV/uTI2I/ltQw==
X-Received: by 2002:a17:90b:104c:: with SMTP id
	gq12mr4528236pjb.167.1605794676321; 
	Thu, 19 Nov 2020 06:04:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDSzVFT0FOcfoBqp+fFgcMModXenc8VdjygC2tghLfrP8TqDSncL/bmBz/ts0kLJbp/OG4t3kgSHsGNbSMnJ0=
X-Received: by 2002:a17:90b:104c:: with SMTP id
	gq12mr4528199pjb.167.1605794675997; 
	Thu, 19 Nov 2020 06:04:35 -0800 (PST)
MIME-Version: 1.0
From: Andreas Hasenack <andreas@canonical.com>
Date: Thu, 19 Nov 2020 11:04:24 -0300
Message-ID: <CANYNYEGD9843AVu787kvczXyqBx1_+9PXW8g6TDUac2PyQ9O+g@mail.gmail.com>
Subject: Default logging with no rules
To: Linux-audit@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi there,

I started playing with the audit subsystem a few days ago, and noticed
that even without any rules, there is a lot of logging going on. I
understand that rules have to be fine tuned, and I was expecting
having to do that, but I wasn't expecting the amount of logs on a busy
system with no rules at all.

I read in an old presentation (~2011) that these come from "trusted
apps", and in fact any process with cap_audit_write (iirc) can log
such events. The tip was that exclude/never list/action could be used
to reduce this noise, is that still the case and recommended approach?
Or is there a way to use audit with only the rules defined in
/etc/audit/rules.d?

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

