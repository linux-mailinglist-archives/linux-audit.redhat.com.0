Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1E925E7E2
	for <lists+linux-audit@lfdr.de>; Sat,  5 Sep 2020 15:25:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-y1SRFZSXPIizHmCCw04p4A-1; Sat, 05 Sep 2020 09:25:45 -0400
X-MC-Unique: y1SRFZSXPIizHmCCw04p4A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0E5318A2241;
	Sat,  5 Sep 2020 13:25:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 826C17E17F;
	Sat,  5 Sep 2020 13:25:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D263418561B1;
	Sat,  5 Sep 2020 13:25:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 085DPWaj005684 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 5 Sep 2020 09:25:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 02EE32144B30; Sat,  5 Sep 2020 13:25:32 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F23F82144B2F
	for <linux-audit@redhat.com>; Sat,  5 Sep 2020 13:25:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0AE99185A78B
	for <linux-audit@redhat.com>; Sat,  5 Sep 2020 13:25:29 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-254-2PLEQ8F2MDykPYNeos_-fw-1; Sat, 05 Sep 2020 09:25:26 -0400
X-MC-Unique: 2PLEQ8F2MDykPYNeos_-fw-1
Received: by mail-ej1-f65.google.com with SMTP id e23so12147242eja.3
	for <linux-audit@redhat.com>; Sat, 05 Sep 2020 06:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ie9e005vGpeYxWm0WXYp4ZFqRLXamHsEroBYvkvSe6o=;
	b=XLzEY1YkuIN+OgXTt4HV4rR7X43bdiVtcWmVO5OoGGoUb9EhVpQJpz2Y0fLdLfd65N
	yaBiB4iKGxH63QVeaE7c1ywkFLevDUlmtsYLyi8KD9IIgqJsyoCmLrCZFNAi4fWLFKq5
	0/32iaTeqcR9yUfNovUAb3y4IaAnyonU0g8eZZAORLIpIME0zupbNDcAlf8dkibCKnMX
	PRlzFT2bgPlpvPkRisaalSrVygNiTybeEznZL2KM/A444cdXMMS1x4Oroq16Qd1dVzrZ
	2U4TEEfq5xdJOGzJP4YGjBWNS+GE9eRSY/miYnmkPDsHxPNvqcHCqsOG8TlnuCBCXcLQ
	voJQ==
X-Gm-Message-State: AOAM531ptl2tM8XYGyMqJh4meRPfb/NEg6XRWFM+RjUv7SfjwlGZN8hU
	3RuGWxashrvJ04/wJYokXZvNg78btUY+UTlT7OGL
X-Google-Smtp-Source: ABdhPJwCaOgYK/F9wk68UkyQKW1/SozAMRuWXaWQi2G9kZivtfrjsCtXnEpBDCt41ghL1Cqjg24uuP1iTYI81sdPCzQ=
X-Received: by 2002:a17:906:5205:: with SMTP id
	g5mr12119953ejm.488.1599312324669; 
	Sat, 05 Sep 2020 06:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200826145247.10029-1-casey@schaufler-ca.com>
	<20200826145247.10029-6-casey@schaufler-ca.com>
	<CAHC9VhSh=r4w_3mZOUwmKN0UxCMxPNGKd=_vr_iGV06rvCNbSA@mail.gmail.com>
	<1eeef766-405f-3800-c0cf-3eb008f9673e@schaufler-ca.com>
	<CAHC9VhSf8RWUnRPYLR6LLzbn-cvNg8J0wnZGwTOAe=dOqkvd0g@mail.gmail.com>
	<ef6a049a-c6b9-370b-c521-4594aa73e403@schaufler-ca.com>
In-Reply-To: <ef6a049a-c6b9-370b-c521-4594aa73e403@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 5 Sep 2020 09:25:13 -0400
Message-ID: <CAHC9VhSu4qqKWsutm3=GF_pihUKpwjAtc9gAhfjGsGtKfz-Azw@mail.gmail.com>
Subject: Re: [PATCH v20 05/23] net: Prepare UDS for security module stacking
To: Casey Schaufler <casey@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, selinux@vger.kernel.org,
	James Morris <jmorris@namei.org>,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	casey.schaufler@intel.com, Stephen Smalley <sds@tycho.nsa.gov>
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

On Fri, Sep 4, 2020 at 7:58 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> On 9/4/2020 2:53 PM, Paul Moore wrote:
> > On Fri, Sep 4, 2020 at 5:35 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> >> On 9/4/2020 1:08 PM, Paul Moore wrote:

...

> > I understand the concerns you mention, they are all valid as far as
> > I'm concerned, but I think we are going to get burned by this code as
> > it currently stands.
>
> Yes, I can see that. We're getting burned by the non-extensibility
> of secids. It will take someone smarter than me to figure out how to
> fit N secids into 32bits without danger of either failure or memory
> allocation.

Sooo what are the next steps here?  It sounds like there is some
agreement that the currently proposed unix_skb_params approach is a
problem, but it also sounds like you just want to merge it anyway?

I was sorta hoping for something a bit better.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

