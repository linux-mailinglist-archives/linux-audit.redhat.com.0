Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C7D690EA1
	for <lists+linux-audit@lfdr.de>; Thu,  9 Feb 2023 17:51:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675961478;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vbkWOimowuDwQRawlutd20cIAQh89LslEDCRrQGabgk=;
	b=TKByor0VtesmxgaT0g4Vrr2h8yeOYgRFs5JBcgtitJlLy5rf+ktAVMf5CmJ8Wu/TlqkVpI
	AqjF8lLsbwRxLgRLaxRAZIWrjXMMwioeDFfPAg6rQRT8/yAepq2i65I8c/QNkXXmC8WHxD
	D5BaYR+4rNj3vzzG4bYtFsGY7VorbeA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-sLqDkv3OMq2PbgaoWWmEbw-1; Thu, 09 Feb 2023 11:51:15 -0500
X-MC-Unique: sLqDkv3OMq2PbgaoWWmEbw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92D988027EB;
	Thu,  9 Feb 2023 16:51:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4A187492C3F;
	Thu,  9 Feb 2023 16:51:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 631C319465A0;
	Thu,  9 Feb 2023 16:51:03 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EBD021946589 for <linux-audit@listman.corp.redhat.com>;
 Thu,  9 Feb 2023 16:51:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DB2592166B2B; Thu,  9 Feb 2023 16:51:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.33.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C37182166B2A
 for <linux-audit@redhat.com>; Thu,  9 Feb 2023 16:51:01 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Linux Audit <linux-audit@redhat.com>
Subject: audit-3.1 released
Date: Thu, 09 Feb 2023 11:40:12 -0500
Message-ID: <5997264.lOV4Wx5bFT@x2>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

I've just released a new version of the audit daemon. It can be
downloaded from http://people.redhat.com/sgrubb/audit. It will also be
in rawhide soon. The ChangeLog is:

- Disable ProtectControlGroups in auditd.service by default
- Fix rule checking for exclude filter
- Make audit_rule_syscallbyname_data work correctly outside of auditctl
- Add new record types
- Add io_uring support
- Add support for new FANOTIFY record fields
- Add keyword, this-hour, to ausearch/report start/end options
- Add Requires.private to audit.pc file
- Try to interpret OPENAT2 fields correctly

ProtectControlGroups in auditd.service was preventing people from placing 
rules on /proc, so it's now off by default. The checks on the exclude filter 
were not matching the checks that kernel does. The checks were updated. 
io_uring support was added as was support for translating the new fields in 
the FANOTIFY record. The interpretation of the mode field in the OPENAT2 
record was broken because it was expected to be in hex format like everywhere 
else, but instead it is decimal. That should be corrected.

SHA256: b5cf3cdabb2786c08b1de3599a3b1a547e55f7a9f9c1eb2078f5b44cf44e8378

Please let me know if you run across any problems with this release.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

