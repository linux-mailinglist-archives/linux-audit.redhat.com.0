Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9228B25E7C8
	for <lists+linux-audit@lfdr.de>; Sat,  5 Sep 2020 15:13:35 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-16iIdNACOuehVm7zey4ejg-1; Sat, 05 Sep 2020 09:13:32 -0400
X-MC-Unique: 16iIdNACOuehVm7zey4ejg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F5A7425E1;
	Sat,  5 Sep 2020 13:13:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D42D160C0F;
	Sat,  5 Sep 2020 13:13:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 53040972E4;
	Sat,  5 Sep 2020 13:13:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 085DD66r004845 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 5 Sep 2020 09:13:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 33F7A2028E91; Sat,  5 Sep 2020 13:13:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DC4C2028CCE
	for <linux-audit@redhat.com>; Sat,  5 Sep 2020 13:13:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A09E3101A540
	for <linux-audit@redhat.com>; Sat,  5 Sep 2020 13:13:03 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-64-jdOrk-qANYuqNgsu13kgaA-1; Sat, 05 Sep 2020 09:13:00 -0400
X-MC-Unique: jdOrk-qANYuqNgsu13kgaA-1
Received: by mail-ed1-f65.google.com with SMTP id l17so8511325edq.12
	for <linux-audit@redhat.com>; Sat, 05 Sep 2020 06:13:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GvmgYYNwHzD6T9Nd+ecI/sUAmb1ZdlUVPQXlDK8Mi+o=;
	b=G5+RNJIpYliouazAMasEaJxa+Z0O4L3H4SipPWLoDzUCkHtFeb9/KIXA0GFQlaJ9uh
	SS0aYqOm5INt7bQC47211ndj3B2hhFFmkBnij/WoUoebfeLmP2hNFOnYc1LEgKkm7hAV
	BK9mhFrq2ie6W5pWqwlZxcoeSJX78cb/TCHa2zJ0I80Cc+mOtPMGbMAF5cKik5fFNoSH
	QXlioxs+bLhI0oI01u315NgNYV81/5q7L5lkbSW40OAcYSBQTlb6KixWTD2nNNFPdC1n
	VJorHYiSJ0a1sPKE/Rd63MZHL48XF4xJR4rWbRJIViLL/UyVKcypPX0TVuEGVp/khE/F
	7BQg==
X-Gm-Message-State: AOAM532rqvsu2kzgFXSzW4VZ7RzXSTaoWvWUr1Zm23CHjmBldnEAa1Ub
	JZwWsdR3nluUeCgt7/1339GA6sCW90UNqnozAJ84
X-Google-Smtp-Source: ABdhPJxB3Um2Vn9uZL41RO2OGBqEPvhsjJCAOIRakxm1XvBVzXIhbB1cUi8oNnUdgF788eEM1r4narnbR2ocdo7LOEE=
X-Received: by 2002:a50:d809:: with SMTP id o9mr13179145edj.12.1599311579532; 
	Sat, 05 Sep 2020 06:12:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200826145247.10029-1-casey@schaufler-ca.com>
	<20200826145247.10029-9-casey@schaufler-ca.com>
In-Reply-To: <20200826145247.10029-9-casey@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 5 Sep 2020 09:12:48 -0400
Message-ID: <CAHC9VhT3qBz4Zki-cF5-n4v2vD13zoQnXJUXGkygj5dn28-6Ag@mail.gmail.com>
Subject: Re: [PATCH v20 08/23] LSM: Use lsmblob in security_ipc_getsecid
To: Casey Schaufler <casey@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 26, 2020 at 11:10 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> There may be more than one LSM that provides IPC data
> for auditing. Change security_ipc_getsecid() to fill in
> a lsmblob structure instead of the u32 secid. The
> audit data structure containing the secid will be updated
> later, so there is a bit of scaffolding here.
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: John Johansen <john.johansen@canonical.com>
> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> ---
>  include/linux/security.h |  7 ++++---
>  kernel/auditsc.c         |  7 ++++++-
>  security/security.c      | 12 +++++++++---
>  3 files changed, 19 insertions(+), 7 deletions(-)

Acked-by: Paul Moore <paul@paul-moore.com>

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

