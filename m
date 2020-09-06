Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 27B6D25EC59
	for <lists+linux-audit@lfdr.de>; Sun,  6 Sep 2020 05:31:12 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-_wJdM3FTPUKCIbDWoQJcZA-1; Sat, 05 Sep 2020 23:31:08 -0400
X-MC-Unique: _wJdM3FTPUKCIbDWoQJcZA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE60618A224A;
	Sun,  6 Sep 2020 03:31:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AC865D9CC;
	Sun,  6 Sep 2020 03:31:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 251C1972F0;
	Sun,  6 Sep 2020 03:30:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0863Upjs026419 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 5 Sep 2020 23:30:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 730732157F25; Sun,  6 Sep 2020 03:30:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E1B32157F23
	for <linux-audit@redhat.com>; Sun,  6 Sep 2020 03:30:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF07E856DF1
	for <linux-audit@redhat.com>; Sun,  6 Sep 2020 03:30:48 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-498-h1BOdAM3PxmO7AFwkUPRyQ-1; Sat, 05 Sep 2020 23:30:46 -0400
X-MC-Unique: h1BOdAM3PxmO7AFwkUPRyQ-1
Received: by mail-ed1-f65.google.com with SMTP id c10so9492532edk.6
	for <linux-audit@redhat.com>; Sat, 05 Sep 2020 20:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6wHPPkaxeVFFOMr8d/2od9ySdonpQKZ/DXTg8kyqTpY=;
	b=YcNc2GY5wB2Bdu6MjpRiRvQXBYJQxyZgn9PP8/AjxjT1fr0xBefXZ5KamQgJh4G309
	NGGLbkxYB2ApTj4GTbejxrhkrIARTjRtS10Tt/yJJpZamBMarwpjAkCh5td0kpc2Xyt8
	O7Bj1Y3aZJvRQACwSI0CdQxZgyOiFN2HPajfWqra5Uk9fUnbWTh1krCqUjgTEwN6IznA
	ifpxrxl4MPSyqIRc1PTSiCKT8uCpeoMcid8l3FOt045aZoE7ENd3Qx5vh+uihBiBXMOr
	zeSNpLS8W7bPb6v/dYsDw0aACEVddXyvnOBW8uBgPICKvr0eTbxddCyhFcWbIOKesi2q
	OS8g==
X-Gm-Message-State: AOAM530OKivpCV2UVaLMexqr0U3i4j5ErYcEaCz7XHoatib6g7Mb/boL
	GAsiHBH3GoJGcIPcDFbJbC946bXrDWijXnU+fHNi8j1/Aw==
X-Google-Smtp-Source: ABdhPJzVAMR+sYipg/mqKopXx4XD3m78OLyZOYpqhPzK5b9xqhrEJrZoytomjyX1EExMN6zZkGauipOAmeRGRvpBsmQ=
X-Received: by 2002:aa7:de8f:: with SMTP id j15mr15381707edv.135.1599363045145;
	Sat, 05 Sep 2020 20:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200826145247.10029-1-casey@schaufler-ca.com>
	<20200826145247.10029-20-casey@schaufler-ca.com>
In-Reply-To: <20200826145247.10029-20-casey@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 5 Sep 2020 23:30:34 -0400
Message-ID: <CAHC9VhQsra7H1an4431q_2Fu2G6uCtqYZXfKSKxW6Bp_OfXshw@mail.gmail.com>
Subject: Re: [PATCH v20 19/23] LSM: Verify LSM display sanity in binder
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 26, 2020 at 11:22 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> Verify that the tasks on the ends of a binder transaction
> use the same "display" security module. This prevents confusion
> of security "contexts".
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> ---
>  security/security.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)

Acked-by: Paul Moore <paul@paul-moore.com>

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

