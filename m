Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC0F137B07
	for <lists+linux-audit@lfdr.de>; Sat, 11 Jan 2020 03:18:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578709126;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZKci41V3OcXSjTL+Dj7TbdEJdCvKYYUvrXjkCZctdt8=;
	b=cy6c7/JTiUXUkjJkx7VceGOUlVaCddGhelBQW1j2pgouMAJBOf8rjblJy3N6akP6to6sk2
	MaakB2e2uX8sRX0/aM98ZkUbLCUonb/R8f0YgVG6exWNDg2VIhFQ+S54Zn8LsPIqqgak4e
	L+zuf/jrAlmNIYondAvjURib3SgP8wM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-Fmy5e7MBNJerbSjCOvysbQ-1; Fri, 10 Jan 2020 21:18:44 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05BAF800D41;
	Sat, 11 Jan 2020 02:18:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F4075DA32;
	Sat, 11 Jan 2020 02:18:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EFD811809567;
	Sat, 11 Jan 2020 02:18:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00B2I7gb025931 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 10 Jan 2020 21:18:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 717A85DA32; Sat, 11 Jan 2020 02:18:07 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-24.phx2.redhat.com [10.3.116.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DFCA05DA70;
	Sat, 11 Jan 2020 02:18:04 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Tony Jones <tonyj@suse.de>
Subject: Re: [PATCH] audit: fix external header definitions for gcc10
Date: Fri, 10 Jan 2020 21:18:03 -0500
Message-ID: <1871063.F7JoL3MBZj@x2>
Organization: Red Hat
In-Reply-To: <20200111000346.GA22149@suse.de>
References: <20200111000346.GA22149@suse.de>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: Fmy5e7MBNJerbSjCOvysbQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Friday, January 10, 2020 7:03:47 PM EST Tony Jones wrote:
> Header definitions need to be external when building with -fno-common
> (which is default in GCC 10).

Applied. Thanks!

-Steve

> (.text+0x0): multiple definition of `event_node_list'; ausearch.o (symbol
> from plugin):(.text+0x0): first defined here [   60s]
> /usr/lib64/gcc/x86_64-suse-linux/9/../../../../x86_64-suse-linux/bin/ld:
> ausearch-time.o (symbol from plugin): in function `lookup_time':
> 
> Fixes: ff25054df7ed
> ---
>  src/ausearch-common.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/src/ausearch-common.h b/src/ausearch-common.h
> index 6669203..3040547 100644
> --- a/src/ausearch-common.h
> +++ b/src/ausearch-common.h
> @@ -50,7 +50,7 @@ extern pid_t event_pid;
>  extern int event_exact_match;
>  extern uid_t event_uid, event_euid, event_loginuid;
>  extern const char *event_tuid, *event_teuid, *event_tauid;
> -slist *event_node_list;
> +extern slist *event_node_list;
>  extern const char *event_comm;
>  extern const char *event_filename;
>  extern const char *event_hostname;
> --
> 2.21.0




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

