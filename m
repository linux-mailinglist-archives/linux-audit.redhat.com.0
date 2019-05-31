Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADE23162C
	for <lists+linux-audit@lfdr.de>; Fri, 31 May 2019 22:37:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 866B330BB37D;
	Fri, 31 May 2019 20:37:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2597710027B7;
	Fri, 31 May 2019 20:37:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A90621806B15;
	Fri, 31 May 2019 20:37:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4VKbI73013039 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 31 May 2019 16:37:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4219B1B428; Fri, 31 May 2019 20:37:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-121-148.rdu2.redhat.com [10.10.121.148])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 97D355C57D;
	Fri, 31 May 2019 20:37:13 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH ghau93 v1] add support to filter on sockaddr family
Date: Fri, 31 May 2019 16:37:10 -0400
Message-ID: <2066826.q3lDRu4DR0@x2>
Organization: Red Hat
In-Reply-To: <1556297985-1229-1-git-send-email-rgb@redhat.com>
References: <1556297985-1229-1-git-send-email-rgb@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
Cc: Linux-Audit Mailing List <linux-audit@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Fri, 31 May 2019 20:37:40 +0000 (UTC)

On Friday, April 26, 2019 12:59:45 PM EDT Richard Guy Briggs wrote:
> Provide a method to filter on network address family.
> 
> This adds support for the kernel filter for sockaddr family,
> AUDIT_SADDR_FAM, adding the command line option "saddr_fam" to auditctl.
> 
> See: https://github.com/linux-audit/audit-kernel/issues/64
> See: https://github.com/linux-audit/audit-userspace/issues/93
> 
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>

Applied.

Thanks,
-Steve


> ---
>  lib/errormsg.h | 2 ++
>  lib/fieldtab.h | 1 +
>  lib/libaudit.c | 6 ++++++
>  lib/libaudit.h | 3 +++
>  4 files changed, 12 insertions(+)
> 
> diff --git a/lib/errormsg.h b/lib/errormsg.h
> index fd8c4a4b1311..fc03b2475034 100644
> --- a/lib/errormsg.h
> +++ b/lib/errormsg.h
> @@ -70,6 +70,7 @@ struct msg_tab {
>  #define EAU_FIELDUNAVAIL	34
>  #define EAU_FILTERNOSUPPORT	35
>  #define EAU_FSTYPEUNKNOWN	36
> +#define EAU_FIELDVALTOOBIG	37
>  static const struct msg_tab err_msgtab[] = {
>      { -EAU_OPMISSING,		2, "-F missing operation for" },
>      { -EAU_FIELDUNKNOWN,	2, "-F unknown field:" },
> @@ -107,5 +108,6 @@ static const struct msg_tab err_msgtab[] = {
>      { -EAU_FIELDUNAVAIL,	1, "field is not valid for the filter" },
>      { -EAU_FILTERNOSUPPORT,	1, "filter is not supported by the kernel" },
>      { -EAU_FSTYPEUNKNOWN,	2, "file system type is unknown for field:" },
> +    { -EAU_FIELDVALTOOBIG,	2, "value is too large for field:" },
>  };
>  #endif
> diff --git a/lib/fieldtab.h b/lib/fieldtab.h
> index c425d5b86049..b597cafb2df8 100644
> --- a/lib/fieldtab.h
> +++ b/lib/fieldtab.h
> @@ -69,3 +69,4 @@ _S(AUDIT_ARG3,         "a3"           )
> 
>  _S(AUDIT_FILTERKEY,    "key"          )
>  _S(AUDIT_EXE,          "exe"          )
> +_S(AUDIT_SADDR_FAM,    "saddr_fam"    )
> diff --git a/lib/libaudit.c b/lib/libaudit.c
> index 2af017a0e520..2e4b148edde9 100644
> --- a/lib/libaudit.c
> +++ b/lib/libaudit.c
> @@ -40,6 +40,7 @@
>  #include <limits.h>	/* for PATH_MAX */
>  #include <sys/stat.h>
>  #include <sys/types.h>
> +#include <sys/socket.h> /* AF_MAX */
>  #ifdef HAVE_LIBCAP_NG
>  #include <cap-ng.h>
>  #endif
> @@ -1742,6 +1743,11 @@ int audit_rule_fieldpair_data(struct audit_rule_data
> **rulep, const char *pair, else if (strcmp(v, "unset") == 0)
>  				rule->values[rule->field_count] = 4294967295;
>  			break;
> +		case AUDIT_SADDR_FAM:
> +			rule->values[rule->field_count] = strtoul(v, NULL, 0);
> +			if (rule->values[rule->field_count] >= AF_MAX)
> +				return -EAU_FIELDVALTOOBIG;
> +			break;
>  		case AUDIT_DEVMAJOR...AUDIT_INODE:
>  		case AUDIT_SUCCESS:
>  			if (flags != AUDIT_FILTER_EXIT)
> diff --git a/lib/libaudit.h b/lib/libaudit.h
> index 77e4142beea2..89fe4839a69b 100644
> --- a/lib/libaudit.h
> +++ b/lib/libaudit.h
> @@ -356,6 +356,9 @@ extern "C" {
>  #ifndef AUDIT_EXE
>  #define AUDIT_EXE 112
>  #endif
> +#ifndef AUDIT_SADDR_FAM
> +#define AUDIT_SADDR_FAM 113
> +#endif
> 
>  #ifndef AUDIT_SESSIONID
>  #define AUDIT_SESSIONID 25




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
