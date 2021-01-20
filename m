Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D82CE2FD7B2
	for <lists+linux-audit@lfdr.de>; Wed, 20 Jan 2021 19:04:36 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-xstu_N4INIe8dMeNplNr6g-1; Wed, 20 Jan 2021 13:04:33 -0500
X-MC-Unique: xstu_N4INIe8dMeNplNr6g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 097C1835DE0;
	Wed, 20 Jan 2021 18:04:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A26A746;
	Wed, 20 Jan 2021 18:04:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8A64A4A7C6;
	Wed, 20 Jan 2021 18:04:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10KI3qXT012804 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 20 Jan 2021 13:03:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 83B80112D189; Wed, 20 Jan 2021 18:03:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B831112D183
	for <linux-audit@redhat.com>; Wed, 20 Jan 2021 18:03:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34FE0805F56
	for <linux-audit@redhat.com>; Wed, 20 Jan 2021 18:03:52 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-507-_ty5qEvhOAmxJd2IcoaBrQ-1;
	Wed, 20 Jan 2021 13:03:34 -0500
X-MC-Unique: _ty5qEvhOAmxJd2IcoaBrQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 95841AF5B;
	Wed, 20 Jan 2021 17:52:26 +0000 (UTC)
Date: Wed, 20 Jan 2021 14:52:24 -0300
From: Enzo Matsumiya <ematsumiya@suse.de>
To: linux-audit@redhat.com
Subject: [RFC] audit.spec: create audit group for log read access
Message-ID: <20210120175224.dchx7f6z6i2bslst@hyori>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Hi,

We (SUSE) would like to introduce an "audit" group for log read access.

This would be handled only by patching the .spec file to create the
group and modify the permissions of the default log dir/file to:

drwxr-x--- 1 root audit     322 25. Okt 21:06 /var/log/audit/
-rw-r----- 1 root audit 1815972 26. Okt 22:23 /var/log/audit/audit.log

No source code modifications are required, as log_group_parser() should
handle invalid entries.

If an enforcement or warning is required for when log_group is not
using the default "audit" group, it should be easy to do as well.

For those wondering, Common Criteria seems to be fine with this
modification.

Excerpt from SUSE's CC certification (RH's seems to match):

---- begin ----
6.2.1.4 Restricted audit review (FAU_SAR.2)

FAU_SAR.2.1	The TSF shall prohibit all users read access to the audit records, except those
		users that have been granted explicit read-access.

Application Note: The protection of the audit records is based on the Unix permission bit
settings defined by FDP_ACC.1(PSO) supported by FDP_ACF.1(PSO).
---- end ----

Please let me know of your concerns, if any.

I have a working patch that I can submit right away in case this gets an
ok.


Cheers,

Enzo

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

