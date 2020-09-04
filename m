Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1872825E374
	for <lists+linux-audit@lfdr.de>; Fri,  4 Sep 2020 23:50:36 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-iXAKeHcWODqoH5zx-ROj-g-1; Fri, 04 Sep 2020 17:50:33 -0400
X-MC-Unique: iXAKeHcWODqoH5zx-ROj-g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6B5018B9ECA;
	Fri,  4 Sep 2020 21:50:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CD587ED66;
	Fri,  4 Sep 2020 21:50:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D547E972E1;
	Fri,  4 Sep 2020 21:50:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 084LoIp8027387 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 4 Sep 2020 17:50:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A549510FF32; Fri,  4 Sep 2020 21:50:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A09BA10FF28
	for <linux-audit@redhat.com>; Fri,  4 Sep 2020 21:50:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D59E8FEA49
	for <linux-audit@redhat.com>; Fri,  4 Sep 2020 21:50:16 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-507-nktnV0mXMMShs9gGiULkJw-1; Fri, 04 Sep 2020 17:50:14 -0400
X-MC-Unique: nktnV0mXMMShs9gGiULkJw-1
Received: by mail-ed1-f66.google.com with SMTP id q21so7465449edv.1
	for <linux-audit@redhat.com>; Fri, 04 Sep 2020 14:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uVsIwTxyprH6j0iLqP03s7+W2xRaNGWvThLcMex9TBw=;
	b=CdpNgw0gy6KMqKNcGt7HqjSJiYrQ3yXKYcBJBL9CqU7m7KzCFYSoow5RiM+lymIwf/
	nBWOvPH7JrdxWm6imo86MNeTZ2OWvEO10WU2mdsSDQFHbXhVCtyh0VEGLg/tLSin3uPh
	Y5zj5zBaQ+xRwu8asRYFUWFXA1H8sHwPqsTsnaTDjmzPlRavpYhYYgBp2GZytrSRG5yM
	jmUuiwE2f2aHG4y245vu+yJ1i3HokgEb7BN/ZAUhNP/O+IG4cQlGg8a5goBuZXTFnrLi
	6nd2s2lYVPEn+M9xWhs6GTbu+X3JHlD/h21yV+ZVSXgnElguji+YVvOf0kuNdIFGi0kB
	00JQ==
X-Gm-Message-State: AOAM530PQRB7DxUYYAgAP17jC5EX1GAxxNWsaktGVkVjO37q5p2cCGm0
	pt+12f1zeByuIty3iuz7k4WAxe7ab/Bp/0pRWL+F
X-Google-Smtp-Source: ABdhPJzhUBLxP35s807gL5ypn/M5pmLMf342joKY10Hwhdd8e/DwkuxN+uaYGkhHZ2cdEuWatntsasFKkCAUM04c8d8=
X-Received: by 2002:a50:8e17:: with SMTP id 23mr10683869edw.31.1599256212457; 
	Fri, 04 Sep 2020 14:50:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200826145247.10029-1-casey@schaufler-ca.com>
	<20200826145247.10029-3-casey@schaufler-ca.com>
In-Reply-To: <20200826145247.10029-3-casey@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 4 Sep 2020 17:50:01 -0400
Message-ID: <CAHC9VhQQh5q86Xki8vevDnHyhRRy8Jigxc_CCEOwcDvvFdnC6w@mail.gmail.com>
Subject: Re: [PATCH v20 02/23] LSM: Create and manage the lsmblob data
	structure.
To: Casey Schaufler <casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 26, 2020 at 11:03 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> When more than one security module is exporting data to
> audit and networking sub-systems a single 32 bit integer
> is no longer sufficient to represent the data. Add a
> structure to be used instead.
>
> The lsmblob structure is currently an array of
> u32 "secids". There is an entry for each of the
> security modules built into the system that would
> use secids if active. The system assigns the module
> a "slot" when it registers hooks. If modules are
> compiled in but not registered there will be unused
> slots.
>
> A new lsm_id structure, which contains the name
> of the LSM and its slot number, is created. There
> is an instance for each LSM, which assigns the name
> and passes it to the infrastructure to set the slot.
>
> The audit rules data is expanded to use an array of
> security module data rather than a single instance.
> Because IMA uses the audit rule functions it is
> affected as well.
>
> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> Acked-by: Paul Moore <paul@paul-moore.com>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> ---
>  include/linux/audit.h               |  4 +-
>  include/linux/lsm_hooks.h           | 12 ++++-
>  include/linux/security.h            | 67 +++++++++++++++++++++++++--
>  kernel/auditfilter.c                | 24 +++++-----
>  kernel/auditsc.c                    | 12 ++---
>  security/apparmor/lsm.c             |  7 ++-
>  security/bpf/hooks.c                | 12 ++++-
>  security/commoncap.c                |  7 ++-
>  security/integrity/ima/ima_policy.c | 40 +++++++++++-----
>  security/loadpin/loadpin.c          |  8 +++-
>  security/lockdown/lockdown.c        |  7 ++-
>  security/safesetid/lsm.c            |  8 +++-
>  security/security.c                 | 72 ++++++++++++++++++++++++-----
>  security/selinux/hooks.c            |  8 +++-
>  security/smack/smack_lsm.c          |  7 ++-
>  security/tomoyo/tomoyo.c            |  8 +++-
>  security/yama/yama_lsm.c            |  7 ++-
>  17 files changed, 254 insertions(+), 56 deletions(-)

...

> diff --git a/include/linux/security.h b/include/linux/security.h
> index 0a0a03b36a3b..c91389d7aebc 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -131,6 +131,65 @@ enum lockdown_reason {
>
>  extern const char *const lockdown_reasons[LOCKDOWN_CONFIDENTIALITY_MAX+1];
>
> +/*
> + * Data exported by the security modules
> + *
> + * Any LSM that provides secid or secctx based hooks must be included.
> + */
> +#define LSMBLOB_ENTRIES ( \
> +       (IS_ENABLED(CONFIG_SECURITY_SELINUX) ? 1 : 0) + \
> +       (IS_ENABLED(CONFIG_SECURITY_SMACK) ? 1 : 0) + \
> +       (IS_ENABLED(CONFIG_SECURITY_APPARMOR) ? 1 : 0) + \
> +       (IS_ENABLED(CONFIG_BPF_LSM) ? 1 : 0))
> +
> +struct lsmblob {
> +       u32     secid[LSMBLOB_ENTRIES];
> +};
> +
> +#define LSMBLOB_INVALID                -1      /* Not a valid LSM slot number */
> +#define LSMBLOB_NEEDED         -2      /* Slot requested on initialization */
> +#define LSMBLOB_NOT_NEEDED     -3      /* Slot not requested */
> +
> +/**
> + * lsmblob_init - initialize an lsmblob structure.
> + * @blob: Pointer to the data to initialize
> + * @secid: The initial secid value
> + *
> + * Set all secid for all modules to the specified value.
> + */
> +static inline void lsmblob_init(struct lsmblob *blob, u32 secid)
> +{
> +       int i;
> +
> +       for (i = 0; i < LSMBLOB_ENTRIES; i++)
> +               blob->secid[i] = secid;
> +}

As I'm going through the v20 draft of these patches it occurs to me,
at least in the intermediate patches, that there is a pretty common
pattern involving lsmblob_init():

  lsmblob_init(blob, secid);
  func(blob, ...);

... would it make sense to have lsmblob_init() return *blob instead of
void?  It doesn't really matter too much, but it seems like it could
help cleanup some of the code:

  func(lsmblob_init(blob, secid), ...);

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

