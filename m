Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3421F4670
	for <lists+linux-audit@lfdr.de>; Tue,  9 Jun 2020 20:41:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591728081;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ci/XJkuq6w2vfQ3pPLZAW4JI9OI7cSuedsM7vcH3KZo=;
	b=fPPGVdcQjOjeDxTSNLLLkijfqau0hrVfY3FuF2tzzA7aDs39YukrgEx4yltbBC7z71zrLp
	I8+T2ofw1Hf9IT/ILX8IqLbofqV7MkJlaWa27WhSTDS8v5O2TTDh1OSbjfq0Esk0aFVluI
	I4DFMzG/gyrsmT33WOXIHvXdZ0qinsY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-vaZO6hzVMKKxNVkyVqofeA-1; Tue, 09 Jun 2020 14:41:19 -0400
X-MC-Unique: vaZO6hzVMKKxNVkyVqofeA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 219FD91164;
	Tue,  9 Jun 2020 18:41:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC36879C40;
	Tue,  9 Jun 2020 18:41:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DD9AD1809557;
	Tue,  9 Jun 2020 18:41:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 059HYDL9000978 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 9 Jun 2020 13:34:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 767F311315; Tue,  9 Jun 2020 17:34:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71826DBF37
	for <linux-audit@redhat.com>; Tue,  9 Jun 2020 17:34:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D3B28007C8
	for <linux-audit@redhat.com>; Tue,  9 Jun 2020 17:34:11 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-491-EZ01zZqUPcuNYUMklD8yTw-1; Tue, 09 Jun 2020 13:34:06 -0400
X-MC-Unique: EZ01zZqUPcuNYUMklD8yTw-1
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	059HCGLF073622; Tue, 9 Jun 2020 13:34:06 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 31jemaghfg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 09 Jun 2020 13:34:05 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 059HNvaO109837;
	Tue, 9 Jun 2020 13:34:05 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
	[149.81.74.106])
	by mx0b-001b2d01.pphosted.com with ESMTP id 31jemaghey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 09 Jun 2020 13:34:05 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	059HUKOh013946; Tue, 9 Jun 2020 17:34:03 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
	(d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma04fra.de.ibm.com with ESMTP id 31g2s7tk3h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 09 Jun 2020 17:34:03 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 059HY1Rf61472978
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 9 Jun 2020 17:34:01 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 21F9442042;
	Tue,  9 Jun 2020 17:34:01 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C1AA42045;
	Tue,  9 Jun 2020 17:34:00 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.146.136])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue,  9 Jun 2020 17:34:00 +0000 (GMT)
Message-ID: <1591724039.5567.33.camel@linux.ibm.com>
Subject: Re: [PATCH v3] IMA: Add audit log for failure conditions
From: Mimi Zohar <zohar@linux.ibm.com>
To: Richard Guy Briggs <rgb@redhat.com>, Lakshmi Ramasubramanian
	<nramas@linux.microsoft.com>
Date: Tue, 09 Jun 2020 13:33:59 -0400
In-Reply-To: <20200609171555.itbllvtgjdanbbk7@madcap2.tricolour.ca>
References: <20200608215343.4491-1-nramas@linux.microsoft.com>
	<27448076.Og45N0Lxmj@x2>
	<ada45440-aefd-a4b2-2a3b-c012872e86cb@linux.microsoft.com>
	<3776526.Vj75JV9fuy@x2>
	<518a51b7-6c8d-f55f-c73a-b15abae8e0af@linux.microsoft.com>
	<20200609171555.itbllvtgjdanbbk7@madcap2.tricolour.ca>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
	definitions=2020-06-09_10:2020-06-09,
	2020-06-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	malwarescore=0
	lowpriorityscore=0 spamscore=0 priorityscore=1501 cotscore=-2147483648
	bulkscore=0 mlxscore=0 clxscore=1011 suspectscore=0 adultscore=0
	phishscore=0 mlxlogscore=852 impostorscore=0 classifier=spam adjust=0
	reason=mlx scancount=1 engine=8.12.0-2004280000
	definitions=main-2006090130
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 09 Jun 2020 14:41:00 -0400
Cc: linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-audit@redhat.com
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Richard,

On Tue, 2020-06-09 at 13:15 -0400, Richard Guy Briggs wrote:
> On 2020-06-09 10:00, Lakshmi Ramasubramanian wrote:

> If it is added, it should be appended to the end of the record since it
> is an existing record format, then in the case of res=1, errno= should
> still be present (not swing in and out) and just contain zero.  (Or
> another value if there is a non-fatal warning?)

Thank you for the clarification.

Mimi

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

