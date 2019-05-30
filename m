Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EF6302D6
	for <lists+linux-audit@lfdr.de>; Thu, 30 May 2019 21:34:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8F80A3082133;
	Thu, 30 May 2019 19:34:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7FCA53C2E;
	Thu, 30 May 2019 19:34:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 462CF206D2;
	Thu, 30 May 2019 19:34:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4UJY0Sn027393 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 30 May 2019 15:34:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 358907E321; Thu, 30 May 2019 19:34:00 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-16.phx2.redhat.com [10.3.112.16])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E670A7E30A;
	Thu, 30 May 2019 19:33:54 +0000 (UTC)
Date: Thu, 30 May 2019 15:33:52 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] audit: remove the BUG() calls in the audit rule
	comparison functions
Message-ID: <20190530193351.dk52og5s5xgnlzul@madcap2.tricolour.ca>
References: <155923533113.12169.6169677957008313366.stgit@chester>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <155923533113.12169.6169677957008313366.stgit@chester>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Thu, 30 May 2019 19:34:07 +0000 (UTC)

On 2019-05-30 12:55, Paul Moore wrote:
> The audit_data_to_entry() function ensures that the operator is valid
> so we can get rid of these BUG() calls.  We keep the "return 0" just
> so the system behaves in a sane-ish manner should something go
> horribly wrong.
> 
> Signed-off-by: Paul Moore <paul@paul-moore.com>

Acked-by: Richard Guy Briggs <rgb@redhat.com>

> ---
>  kernel/auditfilter.c |    3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
> index e69d136eeaf6..1a21b6aa50d1 100644
> --- a/kernel/auditfilter.c
> +++ b/kernel/auditfilter.c
> @@ -1220,7 +1220,6 @@ int audit_comparator(u32 left, u32 op, u32 right)
>  	case Audit_bittest:
>  		return ((left & right) == right);
>  	default:
> -		BUG();
>  		return 0;
>  	}
>  }
> @@ -1243,7 +1242,6 @@ int audit_uid_comparator(kuid_t left, u32 op, kuid_t right)
>  	case Audit_bitmask:
>  	case Audit_bittest:
>  	default:
> -		BUG();
>  		return 0;
>  	}
>  }
> @@ -1266,7 +1264,6 @@ int audit_gid_comparator(kgid_t left, u32 op, kgid_t right)
>  	case Audit_bitmask:
>  	case Audit_bittest:
>  	default:
> -		BUG();
>  		return 0;
>  	}
>  }
> 
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-audit

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
