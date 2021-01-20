Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3ACF62FD807
	for <lists+linux-audit@lfdr.de>; Wed, 20 Jan 2021 19:16:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611166604;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IrllYsuu0Z2TAnrImeTjNsNuSFILbNYS//TFeNjIHSw=;
	b=duVQzkOeHji9Sfyr8toqik5j3wzta6zEiHpvnVVYcnkec2DNdTr3pReslZ8+MukpElf8U+
	bjow1E8GtLiSYW+4sq5MSS94i/Ql6KIXASWk6q90gPthRtje7OdjBY9wgf10MquVqyyR7F
	m/SJoD7V7xj1htGPJJ0a4yCbfolNHqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-6ttS37bWOhu1XirDmsZKPg-1; Wed, 20 Jan 2021 13:16:42 -0500
X-MC-Unique: 6ttS37bWOhu1XirDmsZKPg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8ABD7107ACE6;
	Wed, 20 Jan 2021 18:16:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF9355C277;
	Wed, 20 Jan 2021 18:16:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 399101809C9F;
	Wed, 20 Jan 2021 18:16:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10KIG9wL014138 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 20 Jan 2021 13:16:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B4A0610023AD; Wed, 20 Jan 2021 18:16:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-114-140.phx2.redhat.com [10.3.114.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 79DFB100238C;
	Wed, 20 Jan 2021 18:16:06 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com, Enzo Matsumiya <ematsumiya@suse.de>
Subject: Re: [RFC] audit.spec: create audit group for log read access
Date: Wed, 20 Jan 2021 13:16:05 -0500
Message-ID: <5439988.DvuYhMxLoT@x2>
Organization: Red Hat
In-Reply-To: <20210120175224.dchx7f6z6i2bslst@hyori>
References: <20210120175224.dchx7f6z6i2bslst@hyori>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

On Wednesday, January 20, 2021 12:52:24 PM EST Enzo Matsumiya wrote:
> We (SUSE) would like to introduce an "audit" group for log read access.
> 
> This would be handled only by patching the .spec file to create the
> group and modify the permissions of the default log dir/file to:
> 
> drwxr-x--- 1 root audit     322 25. Okt 21:06 /var/log/audit/
> -rw-r----- 1 root audit 1815972 26. Okt 22:23 /var/log/audit/audit.log
> 
> No source code modifications are required, as log_group_parser() should
> handle invalid entries.
> 
> If an enforcement or warning is required for when log_group is not
> using the default "audit" group, it should be easy to do as well.
> 
> For those wondering, Common Criteria seems to be fine with this
> modification.
> 
> Excerpt from SUSE's CC certification (RH's seems to match):
> 
> ---- begin ----
> 6.2.1.4 Restricted audit review (FAU_SAR.2)
> 
> FAU_SAR.2.1	The TSF shall prohibit all users read access to the audit
> records, except those users that have been granted explicit read-access.
> 
> Application Note: The protection of the audit records is based on the Unix
> permission bit settings defined by FDP_ACC.1(PSO) supported by
> FDP_ACF.1(PSO).
> ---- end ----
> 
> Please let me know of your concerns, if any.

This might go against the DISA STIG, but otherwise this is using the audit 
system as intended. 
 
> I have a working patch that I can submit right away in case this gets an
> ok.

I consider the audit.spec file to be an example to help others with packaging. 
But I'm not entirely sure if it's 100% in sync with Fedora since they make 
arbitrary policy changes like removing gcc and make from the build root which 
then causes specfile updates. If you want to submit a patch, feel free. I 
would apply it as an example to others.

Best Regards,
-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

