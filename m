Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id EC8E91F424B
	for <lists+linux-audit@lfdr.de>; Tue,  9 Jun 2020 19:30:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591723822;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dLY1qBrNVKmT94e+0WURcPhH67mc/r4RXBLPKz0Roh8=;
	b=Shxd5Bkq6Vu+NPItRJnlM+QkVrfOwLhtPfPsW2SRs+9CDRbTSfNlPSJP6Nd9nwoqHREeVY
	6F70li5oeKEo5TzobCobKDcD0je+tiPDsAUy6qGXUkfr7AzcetpP0coWi8kZTpi3bsRq+C
	gCfnmKsU90CoINCo+ObwsI9dAUOAOwk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-G2fv3ce2PS6feDasdPMm6w-1; Tue, 09 Jun 2020 13:30:20 -0400
X-MC-Unique: G2fv3ce2PS6feDasdPMm6w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 573A3107ACF3;
	Tue,  9 Jun 2020 17:30:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FBD45C1BD;
	Tue,  9 Jun 2020 17:30:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 42BF71809547;
	Tue,  9 Jun 2020 17:30:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 059HFF9l030804 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 9 Jun 2020 13:15:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C8C222026971; Tue,  9 Jun 2020 17:15:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C49682026E1C
	for <linux-audit@redhat.com>; Tue,  9 Jun 2020 17:15:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8EB908007B1
	for <linux-audit@redhat.com>; Tue,  9 Jun 2020 17:15:12 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-241-5DQv4bHpMzS2x5AeZcRJTQ-1; Tue, 09 Jun 2020 13:15:07 -0400
X-MC-Unique: 5DQv4bHpMzS2x5AeZcRJTQ-1
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	059H1kxq065235; Tue, 9 Jun 2020 13:15:05 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 31gg821tdw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 09 Jun 2020 13:15:04 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 059H1wwa065954;
	Tue, 9 Jun 2020 13:15:02 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
	[159.122.73.70])
	by mx0a-001b2d01.pphosted.com with ESMTP id 31gg821tc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 09 Jun 2020 13:15:02 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	059HBROl027618; Tue, 9 Jun 2020 17:14:59 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
	(d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma01fra.de.ibm.com with ESMTP id 31g2s7tktt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 09 Jun 2020 17:14:59 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 059HEvsT57082040
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 9 Jun 2020 17:14:57 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8828F42041;
	Tue,  9 Jun 2020 17:14:57 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B7EC54203F;
	Tue,  9 Jun 2020 17:14:56 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.146.136])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue,  9 Jun 2020 17:14:56 +0000 (GMT)
Message-ID: <1591722896.5567.31.camel@linux.ibm.com>
Subject: Re: [PATCH v3] IMA: Add audit log for failure conditions
From: Mimi Zohar <zohar@linux.ibm.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>, Steve Grubb
	<sgrubb@redhat.com>
Date: Tue, 09 Jun 2020 13:14:56 -0400
In-Reply-To: <518a51b7-6c8d-f55f-c73a-b15abae8e0af@linux.microsoft.com>
References: <20200608215343.4491-1-nramas@linux.microsoft.com>
	<27448076.Og45N0Lxmj@x2>
	<ada45440-aefd-a4b2-2a3b-c012872e86cb@linux.microsoft.com>
	<3776526.Vj75JV9fuy@x2>
	<518a51b7-6c8d-f55f-c73a-b15abae8e0af@linux.microsoft.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
	definitions=2020-06-09_10:2020-06-09,
	2020-06-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	mlxscore=0 malwarescore=0
	suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
	lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015
	bulkscore=0
	mlxlogscore=999 cotscore=-2147483648 classifier=spam adjust=0
	reason=mlx
	scancount=1 engine=8.12.0-2004280000 definitions=main-2006090126
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 09 Jun 2020 13:30:07 -0400
Cc: linux-integrity@vger.kernel.org, linux-audit@redhat.com,
	linux-kernel@vger.kernel.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2020-06-09 at 10:00 -0700, Lakshmi Ramasubramanian wrote:
> On 6/9/20 9:43 AM, Steve Grubb wrote:
> 
> >> The number in parenthesis is the error code (such as ENOMEM, EINVAL,
> >> etc.) IMA uses this format for reporting TPM errors in one of the audit
> >> messages (In ima_add_template_entry()). I followed the same pattern.
> >>
> >> Would it be better if the value for "cause" is formatted as
> >>
> >>      cause=hashing_error_-22
> >>
> >>      cause=alloc_entry_-12
> > 
> > Neither fit the name=value style that all other events follow. What would fit
> > the style is something like this:
> > 
> > cause=hashing_error  errno=-22
> >   
> > cause=alloc_entry errno=-12
> > 
> > Would this be OK? Also, errno is only to illustrate. You can name it
> > something else as long as there are no use case collisions with our
> > dictionary of field names.
> > 
> > https://github.com/linux-audit/audit-documentation/blob/master/specs/fields/
> > field-dictionary.csv
> 
> I am fine with this.
> 
> "errno" is currently not listed in the dictionary of audit message field 
> names (Thanks for the pointer to this one Steve)
> 
> Mimi - please let me know if you have any concerns with adding the 
> "result" code in "errno" field in integrity_audit_msg().
> 
> Sample message:
> 
> [    8.051937] audit: type=1804 audit(1591633422.365:8): pid=1 uid=0 
> auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 
> op=measuring_keys cause=hashing_error errno=-22 comm="systemd" 
> name=".builtin_trusted_keys" res=0

Yes, that's fine.

Mimi

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

