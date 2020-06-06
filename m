Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 34DE11F072A
	for <lists+linux-audit@lfdr.de>; Sat,  6 Jun 2020 17:06:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591455977;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/AkSPk6+IKJiA+ZrWa+pFSXPXnWC2MMZQcDzaV2SOyM=;
	b=b72KILlwe7xhaJt/9IrPo+VwNXtoN14r7YmawUOl79KLtGqPM5nSeEx+ZOtn8xMRB/f4GR
	1+NGnyt6ccl01b/RCuXyiYtEkM2Uq00zxs969NrhZKiASn/kmZk3h+1zNbvOMKrrJmR/oH
	Fh8QNbbZvZNgJ8nqcx+tW56nflHiryg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-vcbhnCOEMvSHG0I-b0sRng-1; Sat, 06 Jun 2020 11:06:14 -0400
X-MC-Unique: vcbhnCOEMvSHG0I-b0sRng-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37F371883604;
	Sat,  6 Jun 2020 15:06:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB8DF5C6D9;
	Sat,  6 Jun 2020 15:06:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 288DD1809547;
	Sat,  6 Jun 2020 15:05:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0563E62S002373 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 5 Jun 2020 23:14:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CA51E2166B27; Sat,  6 Jun 2020 03:14:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C58902166B28
	for <linux-audit@redhat.com>; Sat,  6 Jun 2020 03:14:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8880811E77
	for <linux-audit@redhat.com>; Sat,  6 Jun 2020 03:14:03 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-198-iiImy7k4M4SdRbPYhcR-Bw-1;
	Fri, 05 Jun 2020 23:14:01 -0400
X-MC-Unique: iiImy7k4M4SdRbPYhcR-Bw-1
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
	[73.42.176.67])
	by linux.microsoft.com (Postfix) with ESMTPSA id 4A97520B7185;
	Fri,  5 Jun 2020 20:14:00 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4A97520B7185
To: Mimi Zohar <zohar@linux.ibm.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Subject: result logged in integrity audit message
Message-ID: <4c41ce1e-3f97-5b14-8152-5411a3debb57@linux.microsoft.com>
Date: Fri, 5 Jun 2020 20:13:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Sat, 06 Jun 2020 11:05:39 -0400
Cc: linux-integrity@vger.kernel.org, linux-audit@redhat.com
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

Hi Mimi,

In integrity audit message function the inverse of "result" is being 
logged for "res=". Please see below. Is this intentional?

void integrity_audit_msg(int audit_msgno, struct inode *inode,
			 const unsigned char *fname, const char *op,
			 const char *cause, int result, int audit_info)
{

  ...
  audit_log_format(ab, " res=%d", !result);
}

The callers of this function are passing an error code (-ENOMEM, 
-EINVAL, etc.) in the "result" parameter. But that error code is lost - 
instead "res" is set to 0.

For example,

audit: type=1804 audit(1591411737.631:3): pid=1 uid=0 auid=4294967295 
ses=4294967295 subj=kernel op=ima_alloc_key_entry cause=ENOMEM 
comm="swapper/0" name=".builtin_trusted_keys" res=0

thanks,
  -lakshmi

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

