Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 29EE625CCB9
	for <lists+linux-audit@lfdr.de>; Thu,  3 Sep 2020 23:50:22 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-u0qw0dtFOP6J-nlbiNx4DA-1; Thu, 03 Sep 2020 17:50:19 -0400
X-MC-Unique: u0qw0dtFOP6J-nlbiNx4DA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 228472FD11;
	Thu,  3 Sep 2020 21:50:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12FD778B34;
	Thu,  3 Sep 2020 21:50:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E60C11826D2A;
	Thu,  3 Sep 2020 21:50:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 083Lnkxw024171 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 3 Sep 2020 17:49:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 17E45F66BD; Thu,  3 Sep 2020 21:49:46 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1394BF5689
	for <linux-audit@redhat.com>; Thu,  3 Sep 2020 21:49:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0176F8F6E67
	for <linux-audit@redhat.com>; Thu,  3 Sep 2020 21:49:43 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-233-GLHkUgvUNey54iIv7sJcvg-1; Thu, 03 Sep 2020 17:49:40 -0400
X-MC-Unique: GLHkUgvUNey54iIv7sJcvg-1
Received: by mail-ed1-f53.google.com with SMTP id ay8so4158055edb.8
	for <linux-audit@redhat.com>; Thu, 03 Sep 2020 14:49:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tRdD44ooa252jPQTr3SlD5eHHLG1Cfiq4c2JyyoJvFI=;
	b=S1DUB6TLBQTHDgIICLijnU+lJaQjHsZ0YbhKSS5TgI9aTc/8xn2zecHkQDzRxiAVm7
	iaeR12uvvTeZQO6zffQxpprXbSLQyr6dlbRR0z8RalcIc5FiHbEbhj5PtXl2Uxy3xNJP
	cKfGZu+PDlR2hvuVO/QFXRrR0jp2O9Z9EoaKCCsdPmyPHt2MLrAc+Xx4epkI1CRrfVdU
	bjMRAQDuu54mTQ+wqTYkHV12jPlyADVPOA8DiUZcoD976nRVt575ktLz8eg9SxeR12lu
	Qe3zmEP3f5YPUusDjHx+cA0C2av+eo+gqebnXL3xfgZbFqh/ZK2ijvn978MJX1VsqDSP
	qZNA==
X-Gm-Message-State: AOAM533rr9nel+ynjpUY08oJBAvv2vZou5DDnspI4eIqn7QJ8hVwutgA
	xGlpgO6Nz/MgqRrS+Q/s40BNynWbZK9mFbTmHkgs
X-Google-Smtp-Source: ABdhPJwOpksQCOYSRfyTuYdZhy0UiaEWTCEBitsjcs0peI2vbaOLiz+D5IVwdQU+cX0QqHXlH0jLjwIfQI1mYqVLRco=
X-Received: by 2002:a50:8e17:: with SMTP id 23mr5303949edw.31.1599169779286;
	Thu, 03 Sep 2020 14:49:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200826145247.10029-1-casey@schaufler-ca.com>
	<20200826145247.10029-21-casey@schaufler-ca.com>
	<alpine.LRH.2.21.2009040231550.1484@namei.org>
In-Reply-To: <alpine.LRH.2.21.2009040231550.1484@namei.org>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 3 Sep 2020 17:49:28 -0400
Message-ID: <CAHC9VhRoaB=R15jiwGHTnJHvR4+SiiVjEhL1FeGn6z6b6W+hkA@mail.gmail.com>
Subject: Re: [PATCH v20 20/23] Audit: Add new record for multiple process LSM
	attributes
To: James Morris <jmorris@namei.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, selinux@vger.kernel.org,
	casey.schaufler@intel.com, linux-security-module@vger.kernel.org,
	linux-audit@redhat.com, Stephen Smalley <sds@tycho.nsa.gov>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 3, 2020 at 12:32 PM James Morris <jmorris@namei.org> wrote:
> On Wed, 26 Aug 2020, Casey Schaufler wrote:
>
> > Create a new audit record type to contain the subject information
> > when there are multiple security modules that require such data.
> > This record is linked with the same timestamp and serial number.
> > The record is produced only in cases where there is more than one
> > security module with a process "context".
> >
> > Before this change the only audit events that required multiple
> > records were syscall events. Several non-syscall events include
> > subject contexts, so the use of audit_context data has been expanded
> > as necessary.
> >
> > Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> > Cc: linux-audit@redhat.com
>
> Paul, can you review/ack the audit changes?

I did a previous version at some point in the past, I'll take a look
at v20 tomorrow or this weekend.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

